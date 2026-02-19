import 'package:kuwait_weather/data/models/forecast_model.dart';
import 'package:kuwait_weather/data/models/weather_model.dart';
import 'package:kuwait_weather/domain/entities/forecast.dart';
import 'package:kuwait_weather/domain/entities/weather.dart';

const testWeatherModel = WeatherModel(
  main: WeatherMain(temp: 42.0, feelsLike: 45.0, humidity: 20, pressure: 1013),
  weather: [WeatherCondition(main: 'Clear', description: 'clear sky', icon: '01d')],
  wind: WeatherWind(speed: 5.5),
  name: 'Kuwait City',
);

final testWeather = Weather(
  temperature: 42.0,
  feelsLike: 45.0,
  humidity: 20,
  windSpeed: 5.5,
  description: 'clear sky',
  iconCode: '01d',
  cityName: 'Kuwait City',
  pressure: 1013,
  lastUpdated: DateTime(2026, 2, 17, 12, 0),
);

const testForecastResponse = ForecastResponse(
  list: [
    ForecastItem(
      dt: 1739800800,
      main: WeatherMain(temp: 38.0, feelsLike: 40.0, humidity: 25, pressure: 1012),
      weather: [WeatherCondition(main: 'Clouds', description: 'few clouds', icon: '02d')],
      wind: WeatherWind(speed: 4.0),
    ),
    ForecastItem(
      dt: 1739811600,
      main: WeatherMain(temp: 35.0, feelsLike: 37.0, humidity: 30, pressure: 1011),
      weather: [WeatherCondition(main: 'Clear', description: 'clear sky', icon: '01n')],
      wind: WeatherWind(speed: 3.5),
    ),
  ],
);

final testForecasts = [
  Forecast(
    dateTime: DateTime.fromMillisecondsSinceEpoch(1739800800 * 1000),
    temperature: 38.0,
    tempMin: 38.0,
    tempMax: 38.0,
    description: 'few clouds',
    iconCode: '02d',
    humidity: 25,
    windSpeed: 4.0,
  ),
  Forecast(
    dateTime: DateTime.fromMillisecondsSinceEpoch(1739811600 * 1000),
    temperature: 35.0,
    tempMin: 35.0,
    tempMax: 35.0,
    description: 'clear sky',
    iconCode: '01n',
    humidity: 30,
    windSpeed: 3.5,
  ),
];

/// Raw JSON matching OpenWeatherMap /weather API response
const testWeatherJson = <String, dynamic>{
  'main': {
    'temp': 42.0,
    'feels_like': 45.0,
    'humidity': 20,
    'pressure': 1013,
  },
  'weather': [
    {'main': 'Clear', 'description': 'clear sky', 'icon': '01d'},
  ],
  'wind': {'speed': 5.5},
  'name': 'Kuwait City',
};

/// Raw JSON matching OpenWeatherMap /forecast API response
const testForecastJson = <String, dynamic>{
  'list': [
    {
      'dt': 1739800800,
      'main': {
        'temp': 38.0,
        'feels_like': 40.0,
        'humidity': 25,
        'pressure': 1012,
      },
      'weather': [
        {'main': 'Clouds', 'description': 'few clouds', 'icon': '02d'},
      ],
      'wind': {'speed': 4.0},
    },
    {
      'dt': 1739811600,
      'main': {
        'temp': 35.0,
        'feels_like': 37.0,
        'humidity': 30,
        'pressure': 1011,
      },
      'weather': [
        {'main': 'Clear', 'description': 'clear sky', 'icon': '01n'},
      ],
      'wind': {'speed': 3.5},
    },
  ],
};
