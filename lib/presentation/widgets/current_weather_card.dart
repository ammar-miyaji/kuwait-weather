import 'package:flutter/material.dart';
import 'package:kuwait_weather/config/theme/app_theme.dart';
import 'package:kuwait_weather/domain/entities/weather.dart';
import 'package:kuwait_weather/presentation/widgets/common/weather_icon.dart';

class CurrentWeatherCard extends StatelessWidget {
  final Weather weather;
  final String units;

  const CurrentWeatherCard({
    super.key,
    required this.weather,
    this.units = 'metric',
  });

  String get _unitSymbol => units == 'metric' ? '°C' : '°F';

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
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Glow effect behind icon
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withValues(alpha: 0.25),
                              blurRadius: 30,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                      ),
                      WeatherIcon(
                        iconCode: weather.iconCode,
                        size: 80,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  '${weather.temperature.round()}$_unitSymbol',
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
              'Feels like ${weather.feelsLike.round()}$_unitSymbol',
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
