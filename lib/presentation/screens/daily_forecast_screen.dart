import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kuwait_weather/domain/entities/forecast.dart';
import 'package:kuwait_weather/presentation/providers/weather_providers.dart';
import 'package:kuwait_weather/presentation/widgets/daily_forecast_tile.dart';
import 'package:kuwait_weather/presentation/widgets/common/error_view.dart';
import 'package:kuwait_weather/presentation/widgets/common/loading_indicator.dart';

class DailyForecastScreen extends ConsumerWidget {
  const DailyForecastScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forecastAsync = ref.watch(forecastProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Daily Forecast')),
      body: forecastAsync.when(
        data: (forecasts) {
          final dailyGroups = _groupByDay(forecasts);
          return ListView.separated(
            itemCount: dailyGroups.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final entry = dailyGroups.entries.elementAt(index);
              final dayForecasts = entry.value;
              final tempMin = dayForecasts
                  .map((f) => f.temperature)
                  .reduce((a, b) => a < b ? a : b);
              final tempMax = dayForecasts
                  .map((f) => f.temperature)
                  .reduce((a, b) => a > b ? a : b);
              // Use the midday forecast as representative, or first if unavailable
              final representative = _getMiddayForecast(dayForecasts);
              final dayLabel = _formatDayLabel(entry.key);

              return FadeInRight(
                duration: const Duration(milliseconds: 300),
                delay: Duration(milliseconds: 50 * index),
                child: DailyForecastTile(
                  dayLabel: dayLabel,
                  forecast: representative,
                  tempMin: tempMin,
                  tempMax: tempMax,
                ),
              );
            },
          );
        },
        loading: () => const LoadingIndicator(message: 'Loading forecast...'),
        error: (err, _) => ErrorView(
          message: err.toString(),
          onRetry: () => ref.invalidate(forecastProvider),
        ),
      ),
    );
  }

  Map<String, List<Forecast>> _groupByDay(List<Forecast> forecasts) {
    final Map<String, List<Forecast>> groups = {};
    for (final forecast in forecasts) {
      final key = DateFormat('yyyy-MM-dd').format(forecast.dateTime);
      groups.putIfAbsent(key, () => []).add(forecast);
    }
    return groups;
  }

  Forecast _getMiddayForecast(List<Forecast> dayForecasts) {
    // Prefer forecast closest to noon
    return dayForecasts.reduce((a, b) {
      final aDiff = (a.dateTime.hour - 12).abs();
      final bDiff = (b.dateTime.hour - 12).abs();
      return aDiff <= bDiff ? a : b;
    });
  }

  String _formatDayLabel(String dateKey) {
    final date = DateTime.parse(dateKey);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));

    if (date == today) return 'Today';
    if (date == tomorrow) return 'Tomorrow';
    return DateFormat('EEEE, MMM d').format(date);
  }
}
