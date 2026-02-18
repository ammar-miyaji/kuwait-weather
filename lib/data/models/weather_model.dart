import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kuwait_weather/domain/entities/weather.dart';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

@freezed
abstract class WeatherModel with _$WeatherModel {
  const factory WeatherModel({
    required WeatherMain main,
    required List<WeatherCondition> weather,
    required WeatherWind wind,
    required String name,
  }) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}

extension WeatherModelX on WeatherModel {
  Weather toEntity() => Weather(
        temperature: main.temp,
        feelsLike: main.feelsLike,
        humidity: main.humidity,
        windSpeed: wind.speed,
        pressure: main.pressure,
        description: weather.first.description,
        iconCode: weather.first.icon,
        cityName: name,
        lastUpdated: DateTime.now(),
      );
}

@freezed
abstract class WeatherMain with _$WeatherMain {
  const factory WeatherMain({
    required double temp,
    @JsonKey(name: 'feels_like') required double feelsLike,
    required int humidity,
    required int pressure,
  }) = _WeatherMain;

  factory WeatherMain.fromJson(Map<String, dynamic> json) =>
      _$WeatherMainFromJson(json);
}

@freezed
abstract class WeatherCondition with _$WeatherCondition {
  const factory WeatherCondition({
    required String main,
    required String description,
    required String icon,
  }) = _WeatherCondition;

  factory WeatherCondition.fromJson(Map<String, dynamic> json) =>
      _$WeatherConditionFromJson(json);
}

@freezed
abstract class WeatherWind with _$WeatherWind {
  const factory WeatherWind({
    required double speed,
  }) = _WeatherWind;

  factory WeatherWind.fromJson(Map<String, dynamic> json) =>
      _$WeatherWindFromJson(json);
}
