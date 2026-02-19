import 'package:flutter/material.dart';
import 'package:kuwait_weather/domain/entities/forecast.dart';
import 'package:kuwait_weather/presentation/widgets/common/weather_icon.dart';

class DailyForecastTile extends StatelessWidget {
  final String dayLabel;
  final Forecast forecast;
  final double tempMin;
  final double tempMax;

  const DailyForecastTile({
    super.key,
    required this.dayLabel,
    required this.forecast,
    required this.tempMin,
    required this.tempMax,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: WeatherIcon(
        iconCode: forecast.iconCode,
        size: 40,
      ),
      title: Text(dayLabel),
      subtitle: Text(
        forecast.description[0].toUpperCase() +
            forecast.description.substring(1),
        style: theme.textTheme.bodySmall,
      ),
      trailing: Text(
        '${tempMin.round()}° / ${tempMax.round()}°',
        style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
