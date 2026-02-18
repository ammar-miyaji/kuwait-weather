import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';

@freezed
abstract class Weather with _$Weather {
  const factory Weather({
    required double temperature,
    required double feelsLike,
    required int humidity,
    required double windSpeed,
    required String description,
    required String iconCode,
    required String cityName,
    required int pressure,
    required DateTime lastUpdated,
  }) = _Weather;
}
