import 'package:flutter/material.dart';

/// Maps OpenWeatherMap icon codes to Material Icons.
///
/// OWM icon codes: https://openweathermap.org/weather-conditions
/// Format: {condition}{d/n} where d=day, n=night
/// e.g. "01d" = clear sky day, "01n" = clear sky night
class WeatherIcon extends StatelessWidget {
  final String iconCode;
  final double size;
  final Color? color;

  const WeatherIcon({
    super.key,
    required this.iconCode,
    this.size = 40,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isNight = iconCode.endsWith('n');
    final data = _iconData(iconCode);

    return Icon(
      data.icon,
      size: size,
      color: color ?? data.color ?? (isNight ? Colors.blueGrey.shade300 : Colors.orange.shade400),
    );
  }

  static _IconInfo _iconData(String code) {
    // Strip the d/n suffix to get the condition code
    final condition = code.substring(0, 2);
    final isNight = code.endsWith('n');

    return switch (condition) {
      '01' => _IconInfo(
        isNight ? Icons.nightlight_round : Icons.wb_sunny_rounded,
        isNight ? Colors.blueGrey.shade300 : Colors.amber,
      ),
      '02' => _IconInfo(
        isNight ? Icons.nights_stay_rounded : Icons.wb_cloudy_rounded,
        isNight ? Colors.blueGrey.shade300 : Colors.orange.shade300,
      ),
      '03' => _IconInfo(Icons.cloud_rounded, Colors.grey.shade400),
      '04' => _IconInfo(Icons.cloud_rounded, Colors.grey.shade500),
      '09' => _IconInfo(Icons.grain_rounded, Colors.blue.shade300),
      '10' => _IconInfo(
        isNight ? Icons.water_drop_rounded : Icons.beach_access_rounded,
        Colors.blue.shade400,
      ),
      '11' => _IconInfo(Icons.thunderstorm_rounded, Colors.deepPurple.shade300),
      '13' => _IconInfo(Icons.ac_unit_rounded, Colors.lightBlue.shade200),
      '50' => _IconInfo(Icons.foggy, Colors.grey.shade400),
      _ => _IconInfo(Icons.cloud_rounded, Colors.grey.shade400),
    };
  }
}

class _IconInfo {
  final IconData icon;
  final Color? color;
  const _IconInfo(this.icon, [this.color]);
}
