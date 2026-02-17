import 'package:flutter/material.dart';
import 'package:kuwait_weather/core/constants/api_constants.dart';
import 'package:kuwait_weather/features/weather/domain/entities/weather.dart';

class CurrentWeatherCard extends StatelessWidget {
  final Weather weather;

  const CurrentWeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              weather.cityName,
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  ApiConstants.iconUrl(weather.iconCode),
                  width: 80,
                  height: 80,
                  cacheWidth: 160,
                  cacheHeight: 160,
                  gaplessPlayback: true,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.cloud, size: 80),
                ),
                const SizedBox(width: 16),
                Text(
                  '${weather.temperature.round()}°',
                  style: theme.textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              weather.description[0].toUpperCase() +
                  weather.description.substring(1),
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            Text(
              'Feels like ${weather.feelsLike.round()}°',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
