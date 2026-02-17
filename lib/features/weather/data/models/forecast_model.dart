import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kuwait_weather/features/weather/domain/entities/forecast.dart';
import 'package:kuwait_weather/features/weather/data/models/weather_model.dart';

part 'forecast_model.freezed.dart';
part 'forecast_model.g.dart';

@freezed
abstract class ForecastResponse with _$ForecastResponse {
  const factory ForecastResponse({
    required List<ForecastItem> list,
  }) = _ForecastResponse;

  factory ForecastResponse.fromJson(Map<String, dynamic> json) =>
      _$ForecastResponseFromJson(json);
}

@freezed
abstract class ForecastItem with _$ForecastItem {
  const factory ForecastItem({
    required int dt,
    required WeatherMain main,
    required List<WeatherCondition> weather,
    required WeatherWind wind,
  }) = _ForecastItem;

  factory ForecastItem.fromJson(Map<String, dynamic> json) =>
      _$ForecastItemFromJson(json);
}

extension ForecastItemX on ForecastItem {
  Forecast toEntity() => Forecast(
        dateTime: DateTime.fromMillisecondsSinceEpoch(dt * 1000),
        temperature: main.temp,
        tempMin: main.temp,
        tempMax: main.temp,
        description: weather.first.description,
        iconCode: weather.first.icon,
        humidity: main.humidity,
        windSpeed: wind.speed,
      );
}
