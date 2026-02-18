import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kuwait_weather/core/constants/api_constants.dart';
import 'package:kuwait_weather/domain/entities/forecast.dart';

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
          Image.network(
            ApiConstants.iconUrl(forecast.iconCode),
            width: 40,
            height: 40,
            cacheWidth: 80,
            cacheHeight: 80,
            gaplessPlayback: true,
            errorBuilder: (_, __, ___) => const Icon(Icons.cloud, size: 40),
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
