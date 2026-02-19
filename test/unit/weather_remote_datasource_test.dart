import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:kuwait_weather/core/error/exceptions.dart';
import 'package:kuwait_weather/data/datasources/weather_remote_datasource.dart';
import 'package:kuwait_weather/data/models/forecast_model.dart';
import 'package:kuwait_weather/data/models/weather_model.dart';

import '../helpers/fixtures.dart';
import '../helpers/mocks.dart';

void main() {
  late MockDio mockDio;
  late WeatherRemoteDataSource dataSource;

  setUpAll(() {
    dotenv.loadFromString(envString: 'OWM_API_KEY=test_key_123');
  });

  setUp(() {
    mockDio = MockDio();
    dataSource = WeatherRemoteDataSource(dio: mockDio);
  });

  group('fetchCurrentWeather', () {
    test('returns WeatherModel on successful 200 response', () async {
      when(() => mockDio.get(any(), queryParameters: any(named: 'queryParameters')))
          .thenAnswer((_) async => Response(
                data: testWeatherJson,
                statusCode: 200,
                requestOptions: RequestOptions(path: '/weather'),
              ));

      final result = await dataSource.fetchCurrentWeather('Kuwait City', 'metric');

      expect(result.name, 'Kuwait City');
      expect(result.main.temp, 42.0);
      expect(result.main.feelsLike, 45.0);
      expect(result.main.humidity, 20);
      expect(result.main.pressure, 1013);
      expect(result.weather.first.description, 'clear sky');
      expect(result.weather.first.icon, '01d');
      expect(result.wind.speed, 5.5);
    });

    test('throws ServerException on DioException', () async {
      when(() => mockDio.get(any(), queryParameters: any(named: 'queryParameters')))
          .thenThrow(DioException(
        type: DioExceptionType.badResponse,
        message: 'City not found',
        response: Response(
          statusCode: 404,
          requestOptions: RequestOptions(path: '/weather'),
        ),
        requestOptions: RequestOptions(path: '/weather'),
      ));

      expect(
        () => dataSource.fetchCurrentWeather('InvalidCity', 'metric'),
        throwsA(isA<ServerException>()),
      );
    });

    test('throws ServerException with status code on network timeout', () async {
      when(() => mockDio.get(any(), queryParameters: any(named: 'queryParameters')))
          .thenThrow(DioException(
        type: DioExceptionType.connectionTimeout,
        message: 'Connection timeout',
        requestOptions: RequestOptions(path: '/weather'),
      ));

      expect(
        () => dataSource.fetchCurrentWeather('Kuwait City', 'metric'),
        throwsA(
          isA<ServerException>().having((e) => e.statusCode, 'statusCode', isNull),
        ),
      );
    });
  });

  group('fetchForecast', () {
    test('returns ForecastResponse on successful 200 response', () async {
      when(() => mockDio.get(any(), queryParameters: any(named: 'queryParameters')))
          .thenAnswer((_) async => Response(
                data: testForecastJson,
                statusCode: 200,
                requestOptions: RequestOptions(path: '/forecast'),
              ));

      final result = await dataSource.fetchForecast('Kuwait City', 'metric');

      expect(result.list.length, 2);
      expect(result.list.first.main.temp, 38.0);
      expect(result.list.first.weather.first.description, 'few clouds');
      expect(result.list.last.main.temp, 35.0);
      expect(result.list.last.weather.first.icon, '01n');
    });

    test('throws ServerException on DioException', () async {
      when(() => mockDio.get(any(), queryParameters: any(named: 'queryParameters')))
          .thenThrow(DioException(
        type: DioExceptionType.badResponse,
        message: 'Server error',
        response: Response(
          statusCode: 500,
          requestOptions: RequestOptions(path: '/forecast'),
        ),
        requestOptions: RequestOptions(path: '/forecast'),
      ));

      expect(
        () => dataSource.fetchForecast('Kuwait City', 'metric'),
        throwsA(
          isA<ServerException>().having((e) => e.statusCode, 'statusCode', 500),
        ),
      );
    });
  });

  group('toEntity conversion', () {
    test('WeatherModel.toEntity produces correct Weather entity', () {
      final entity = testWeatherModel.toEntity();

      expect(entity.temperature, 42.0);
      expect(entity.feelsLike, 45.0);
      expect(entity.humidity, 20);
      expect(entity.windSpeed, 5.5);
      expect(entity.pressure, 1013);
      expect(entity.description, 'clear sky');
      expect(entity.iconCode, '01d');
      expect(entity.cityName, 'Kuwait City');
    });

    test('ForecastItem.toEntity produces correct Forecast entity', () {
      final item = testForecastResponse.list.first;
      final entity = item.toEntity();

      expect(entity.temperature, 38.0);
      expect(entity.description, 'few clouds');
      expect(entity.iconCode, '02d');
      expect(entity.humidity, 25);
      expect(entity.windSpeed, 4.0);
      expect(entity.dateTime, DateTime.fromMillisecondsSinceEpoch(1739800800 * 1000));
    });
  });
}
