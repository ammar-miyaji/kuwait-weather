import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:kuwait_weather/core/error/exceptions.dart';
import 'package:kuwait_weather/data/models/forecast_model.dart';
import 'package:kuwait_weather/data/models/weather_model.dart';

class WeatherLocalDataSource {
  final Box<dynamic> _weatherBox;
  final Box<dynamic> _forecastBox;

  const WeatherLocalDataSource({
    required Box<dynamic> weatherBox,
    required Box<dynamic> forecastBox,
  })  : _weatherBox = weatherBox,
        _forecastBox = forecastBox;

  Future<WeatherModel> getCachedWeather(String city) async {
    final key = _cacheKey(city);
    final data = _weatherBox.get(key);
    if (data == null) {
      throw const CacheException(message: 'No cached weather data');
    }
    return WeatherModel.fromJson(
        Map<String, dynamic>.from(jsonDecode(data as String)));
  }

  Future<void> cacheWeather(String city, WeatherModel model) async {
    final key = _cacheKey(city);
    await _weatherBox.put(key, jsonEncode(model.toJson()));
    await _weatherBox.put('${key}_timestamp', DateTime.now().toIso8601String());
  }

  Future<DateTime?> getWeatherTimestamp(String city) async {
    final key = _cacheKey(city);
    final timestamp = _weatherBox.get('${key}_timestamp');
    if (timestamp == null) return null;
    return DateTime.parse(timestamp as String);
  }

  Future<List<ForecastItem>> getCachedForecast(String city) async {
    final key = _cacheKey(city);
    final data = _forecastBox.get(key);
    if (data == null) {
      throw const CacheException(message: 'No cached forecast data');
    }
    final decoded = jsonDecode(data as String) as List<dynamic>;
    return decoded
        .map((e) => ForecastItem.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  Future<void> cacheForecast(String city, List<ForecastItem> items) async {
    final key = _cacheKey(city);
    await _forecastBox.put(
        key, jsonEncode(items.map((e) => e.toJson()).toList()));
  }

  Future<void> clearAll() async {
    await _weatherBox.clear();
    await _forecastBox.clear();
  }

  String _cacheKey(String city) => city.toLowerCase().replaceAll(' ', '_');
}
