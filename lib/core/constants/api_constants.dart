import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  const ApiConstants._();

  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
  static String get apiKey => dotenv.env['OWM_API_KEY'] ?? '';

  static const String currentWeatherPath = '/weather';
  static const String forecastPath = '/forecast';

  static String currentWeatherUrl(String city, {String units = 'metric'}) =>
      '$baseUrl$currentWeatherPath?q=$city&appid=$apiKey&units=$units';

  static String forecastUrl(String city, {String units = 'metric'}) =>
      '$baseUrl$forecastPath?q=$city&appid=$apiKey&units=$units';

  static const Duration cacheStaleDuration = Duration(minutes: 30);
  static const Duration defaultRefreshInterval = Duration(minutes: 30);
}
