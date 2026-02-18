import 'package:mocktail/mocktail.dart';
import 'package:kuwait_weather/data/datasources/weather_remote_datasource.dart';
import 'package:kuwait_weather/data/datasources/weather_local_datasource.dart';

class MockWeatherRemoteDataSource extends Mock
    implements WeatherRemoteDataSource {}

class MockWeatherLocalDataSource extends Mock
    implements WeatherLocalDataSource {}
