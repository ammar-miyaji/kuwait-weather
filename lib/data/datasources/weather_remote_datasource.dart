import 'package:dio/dio.dart';
import 'package:kuwait_weather/core/constants/api_constants.dart';
import 'package:kuwait_weather/core/error/exceptions.dart';
import 'package:kuwait_weather/data/models/forecast_model.dart';
import 'package:kuwait_weather/data/models/weather_model.dart';

class WeatherRemoteDataSource {
  final Dio _dio;

  const WeatherRemoteDataSource({required Dio dio}) : _dio = dio;

  Future<WeatherModel> fetchCurrentWeather(
      String city, String units) async {
    try {
      final response = await _dio.get(
        ApiConstants.currentWeatherPath,
        queryParameters: {
          'q': city,
          'appid': ApiConstants.apiKey,
          'units': units,
        },
      );
      return WeatherModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ServerException(
        message: e.message ?? 'Failed to fetch weather',
        statusCode: e.response?.statusCode,
      );
    }
  }

  Future<ForecastResponse> fetchForecast(String city, String units) async {
    try {
      final response = await _dio.get(
        ApiConstants.forecastPath,
        queryParameters: {
          'q': city,
          'appid': ApiConstants.apiKey,
          'units': units,
        },
      );
      return ForecastResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ServerException(
        message: e.message ?? 'Failed to fetch forecast',
        statusCode: e.response?.statusCode,
      );
    }
  }
}
