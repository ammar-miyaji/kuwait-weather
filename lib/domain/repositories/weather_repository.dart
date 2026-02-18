import 'package:kuwait_weather/domain/entities/forecast.dart';
import 'package:kuwait_weather/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Weather> getCurrentWeather(String city, {String units});
  Future<List<Forecast>> getForecast(String city, {String units});
}
