import 'package:flutter/material.dart';
import 'package:kuwait_weather/core/constants/api_constants.dart';
import 'package:kuwait_weather/features/weather/domain/entities/forecast.dart';

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
      leading: Image.network(
        ApiConstants.iconUrl(forecast.iconCode),
        width: 40,
        height: 40,
        cacheWidth: 80,
        cacheHeight: 80,
        gaplessPlayback: true,
        errorBuilder: (_, __, ___) => const Icon(Icons.cloud, size: 40),
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
