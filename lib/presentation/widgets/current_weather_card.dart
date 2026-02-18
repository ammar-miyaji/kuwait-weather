import 'package:flutter/material.dart';
import 'package:kuwait_weather/config/theme/app_theme.dart';
import 'package:kuwait_weather/core/constants/api_constants.dart';
import 'package:kuwait_weather/domain/entities/weather.dart';

class CurrentWeatherCard extends StatelessWidget {
  final Weather weather;

  const CurrentWeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    final condition = weather.description.split(' ').first;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: WeatherGradients.forCondition(condition),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              weather.cityName,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
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
                      const Icon(Icons.cloud, size: 80, color: Colors.white70),
                ),
                const SizedBox(width: 16),
                Text(
                  '${weather.temperature.round()}°',
                  style: const TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Text(
              weather.description[0].toUpperCase() +
                  weather.description.substring(1),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Feels like ${weather.feelsLike.round()}°',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
