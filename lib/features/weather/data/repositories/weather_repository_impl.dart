import 'package:kuwait_weather/core/constants/api_constants.dart';
import 'package:kuwait_weather/core/error/exceptions.dart';
import 'package:kuwait_weather/features/weather/data/datasources/weather_local_datasource.dart';
import 'package:kuwait_weather/features/weather/data/datasources/weather_remote_datasource.dart';
import 'package:kuwait_weather/features/weather/data/models/forecast_model.dart';
import 'package:kuwait_weather/features/weather/data/models/weather_model.dart';
import 'package:kuwait_weather/features/weather/domain/entities/forecast.dart';
import 'package:kuwait_weather/features/weather/domain/entities/weather.dart';
import 'package:kuwait_weather/features/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource _remote;
  final WeatherLocalDataSource _local;

  const WeatherRepositoryImpl({
    required WeatherRemoteDataSource remote,
    required WeatherLocalDataSource local,
  })  : _remote = remote,
        _local = local;

  @override
  Future<Weather> getCurrentWeather(String city,
      {String units = 'metric'}) async {
    // Check if cache is fresh
    final timestamp = await _local.getWeatherTimestamp(city);
    if (timestamp != null) {
      final age = DateTime.now().difference(timestamp);
      if (age < ApiConstants.cacheStaleDuration) {
        try {
          final cached = await _local.getCachedWeather(city);
          return cached.toEntity().copyWith(lastUpdated: timestamp);
        } on CacheException {
          // Cache read failed, continue to remote
        }
      }
    }

    // Try remote
    try {
      final model = await _remote.fetchCurrentWeather(city, units);
      await _local.cacheWeather(city, model);
      return model.toEntity();
    } on ServerException {
      // Remote failed, try stale cache
      try {
        final cached = await _local.getCachedWeather(city);
        return cached
            .toEntity()
            .copyWith(lastUpdated: timestamp ?? DateTime.now());
      } on CacheException {
        rethrow;
      }
    }
  }

  @override
  Future<List<Forecast>> getForecast(String city,
      {String units = 'metric'}) async {
    try {
      final response = await _remote.fetchForecast(city, units);
      await _local.cacheForecast(city, response.list);
      return response.list.map((e) => e.toEntity()).toList();
    } on ServerException {
      try {
        final cached = await _local.getCachedForecast(city);
        return cached.map((e) => e.toEntity()).toList();
      } on CacheException {
        rethrow;
      }
    }
  }
}
