import 'package:kuwait_weather/core/api/dio_client.dart';
import 'package:kuwait_weather/core/services/hive_service.dart';
import 'package:kuwait_weather/data/datasources/weather_local_datasource.dart';
import 'package:kuwait_weather/data/datasources/weather_remote_datasource.dart';
import 'package:kuwait_weather/data/repositories/weather_repository_impl.dart';
import 'package:kuwait_weather/domain/entities/forecast.dart';
import 'package:kuwait_weather/domain/entities/weather.dart';
import 'package:kuwait_weather/domain/repositories/weather_repository.dart';
import 'package:kuwait_weather/presentation/providers/location_providers.dart';
import 'package:kuwait_weather/presentation/providers/settings_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_providers.g.dart';

@riverpod
WeatherRemoteDataSource remoteDataSource(ref) {
  return WeatherRemoteDataSource(dio: ref.watch(dioProvider));
}

@riverpod
WeatherLocalDataSource localDataSource(ref) {
  return WeatherLocalDataSource(
    weatherBox: ref.watch(weatherBoxProvider),
    forecastBox: ref.watch(forecastBoxProvider),
  );
}

@riverpod
WeatherRepository weatherRepository(ref) {
  return WeatherRepositoryImpl(
    remote: ref.watch(remoteDataSourceProvider),
    local: ref.watch(localDataSourceProvider),
  );
}

@riverpod
Future<Weather> currentWeather(ref) {
  final city = ref.watch(selectedCityProvider);
  final units = ref.watch(temperatureUnitsProvider);
  return ref.watch(weatherRepositoryProvider).getCurrentWeather(city, units: units);
}

@riverpod
Future<List<Forecast>> forecast(ref) {
  final city = ref.watch(selectedCityProvider);
  final units = ref.watch(temperatureUnitsProvider);
  return ref.watch(weatherRepositoryProvider).getForecast(city, units: units);
}
