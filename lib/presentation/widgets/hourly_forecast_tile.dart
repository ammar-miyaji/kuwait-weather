import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kuwait_weather/domain/entities/forecast.dart';
import 'package:kuwait_weather/presentation/widgets/common/weather_icon.dart';

class HourlyForecastTile extends StatelessWidget {
  final Forecast forecast;

  const HourlyForecastTile({super.key, required this.forecast});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 80,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            DateFormat('HH:mm').format(forecast.dateTime),
            style: theme.textTheme.bodySmall,
          ),
          WeatherIcon(
            iconCode: forecast.iconCode,
            size: 40,
          ),
          Text(
            '${forecast.temperature.round()}°',
            style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
