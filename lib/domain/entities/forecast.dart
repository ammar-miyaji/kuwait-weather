import 'package:freezed_annotation/freezed_annotation.dart';

part 'forecast.freezed.dart';

@freezed
abstract class Forecast with _$Forecast {
  const factory Forecast({
    required DateTime dateTime,
    required double temperature,
    required double tempMin,
    required double tempMax,
    required String description,
    required String iconCode,
    required int humidity,
    required double windSpeed,
  }) = _Forecast;
}
