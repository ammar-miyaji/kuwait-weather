import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:kuwait_weather/core/error/exceptions.dart';
import 'package:kuwait_weather/features/weather/data/repositories/weather_repository_impl.dart';

import '../helpers/fixtures.dart';
import '../helpers/mocks.dart';

void main() {
  late MockWeatherRemoteDataSource mockRemote;
  late MockWeatherLocalDataSource mockLocal;
  late WeatherRepositoryImpl repository;

  setUp(() {
    mockRemote = MockWeatherRemoteDataSource();
    mockLocal = MockWeatherLocalDataSource();
    repository = WeatherRepositoryImpl(remote: mockRemote, local: mockLocal);
  });

  group('getCurrentWeather', () {
    const city = 'Kuwait City';

    test('returns fresh cached data when cache is not stale', () async {
      final freshTimestamp = DateTime.now().subtract(const Duration(minutes: 5));
      when(() => mockLocal.getWeatherTimestamp(city))
          .thenAnswer((_) async => freshTimestamp);
      when(() => mockLocal.getCachedWeather(city))
          .thenAnswer((_) async => testWeatherModel);

      final result = await repository.getCurrentWeather(city);

      expect(result.cityName, 'Kuwait City');
      expect(result.temperature, 42.0);
      expect(result.lastUpdated, freshTimestamp);
      verifyNever(() => mockRemote.fetchCurrentWeather(any(), any()));
    });

    test('fetches from remote when cache is stale', () async {
      final staleTimestamp =
          DateTime.now().subtract(const Duration(minutes: 60));
      when(() => mockLocal.getWeatherTimestamp(city))
          .thenAnswer((_) async => staleTimestamp);
      when(() => mockRemote.fetchCurrentWeather(city, 'metric'))
          .thenAnswer((_) async => testWeatherModel);
      when(() => mockLocal.cacheWeather(city, testWeatherModel))
          .thenAnswer((_) async {});

      final result = await repository.getCurrentWeather(city);

      expect(result.cityName, 'Kuwait City');
      expect(result.temperature, 42.0);
      verify(() => mockRemote.fetchCurrentWeather(city, 'metric')).called(1);
      verify(() => mockLocal.cacheWeather(city, testWeatherModel)).called(1);
    });

    test('returns stale cache when remote fails and cache exists', () async {
      when(() => mockLocal.getWeatherTimestamp(city))
          .thenAnswer((_) async => null);
      when(() => mockRemote.fetchCurrentWeather(city, 'metric'))
          .thenThrow(const ServerException(message: 'No connection'));
      when(() => mockLocal.getCachedWeather(city))
          .thenAnswer((_) async => testWeatherModel);

      final result = await repository.getCurrentWeather(city);

      expect(result.cityName, 'Kuwait City');
    });

    test('throws when remote fails and no cache exists', () async {
      when(() => mockLocal.getWeatherTimestamp(city))
          .thenAnswer((_) async => null);
      when(() => mockRemote.fetchCurrentWeather(city, 'metric'))
          .thenThrow(const ServerException(message: 'No connection'));
      when(() => mockLocal.getCachedWeather(city))
          .thenThrow(const CacheException(message: 'No cache'));

      expect(
        () => repository.getCurrentWeather(city),
        throwsA(isA<CacheException>()),
      );
    });
  });

  group('getForecast', () {
    const city = 'Kuwait City';

    test('fetches from remote and caches result', () async {
      when(() => mockRemote.fetchForecast(city, 'metric'))
          .thenAnswer((_) async => testForecastResponse);
      when(() => mockLocal.cacheForecast(city, testForecastResponse.list))
          .thenAnswer((_) async {});

      final result = await repository.getForecast(city);

      expect(result.length, 2);
      expect(result.first.temperature, 38.0);
      verify(() => mockLocal.cacheForecast(city, testForecastResponse.list))
          .called(1);
    });

    test('returns cached forecast when remote fails', () async {
      when(() => mockRemote.fetchForecast(city, 'metric'))
          .thenThrow(const ServerException(message: 'No connection'));
      when(() => mockLocal.getCachedForecast(city))
          .thenAnswer((_) async => testForecastResponse.list);

      final result = await repository.getForecast(city);

      expect(result.length, 2);
    });
  });
}
