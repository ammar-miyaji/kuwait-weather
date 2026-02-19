import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:kuwait_weather/core/network/connectivity_provider.dart';
import 'package:kuwait_weather/domain/entities/forecast.dart';
import 'package:kuwait_weather/presentation/providers/location_providers.dart';
import 'package:kuwait_weather/presentation/providers/settings_providers.dart';
import 'package:kuwait_weather/presentation/providers/weather_providers.dart';
import 'package:kuwait_weather/presentation/widgets/common/connectivity_banner.dart';
import 'package:kuwait_weather/presentation/widgets/common/error_view.dart';
import 'package:kuwait_weather/presentation/widgets/common/weather_shimmer.dart';
import 'package:kuwait_weather/presentation/widgets/current_weather_card.dart';
import 'package:kuwait_weather/presentation/widgets/daily_forecast_tile.dart';
import 'package:kuwait_weather/presentation/widgets/hourly_forecast_tile.dart';
import 'package:kuwait_weather/presentation/widgets/last_updated_banner.dart';
import 'package:kuwait_weather/presentation/widgets/weather_info_tile.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherAsync = ref.watch(currentWeatherProvider);
    final forecastAsync = ref.watch(forecastProvider);
    final cityName = ref.watch(selectedCityProvider);
    final units = ref.watch(temperatureUnitsProvider);

    // Keep banner in sync with connectivity changes
    ref.listen<AsyncValue<bool>>(connectivityStreamProvider, (prev, next) {
      final nextOnline = next.valueOrNull;
      if (nextOnline == null) return;

      // Always refresh the banner's provider on any connectivity event
      ref.invalidate(isConnectedProvider);

      final prevOnline = prev?.valueOrNull;
      // Only show snackbar + auto-refresh on actual transitions
      if (prevOnline == null || prevOnline == nextOnline) return;

      if (nextOnline && !prevOnline) {
        ref.invalidate(currentWeatherProvider);
        ref.invalidate(forecastProvider);
      }
      if (context.mounted) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(nextOnline ? 'Back online' : 'You are offline'),
            duration: const Duration(seconds: 2),
            backgroundColor: nextOnline ? Colors.green : Colors.orange,
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(cityName),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_on),
            onPressed: () => context.push('/location'),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.push('/settings'),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(currentWeatherProvider);
          ref.invalidate(forecastProvider);
        },
        child: ListView(
          children: [
            const ConnectivityBanner(),
            weatherAsync.when(
              data: (weather) => Column(
                children: [
                  LastUpdatedBanner(lastUpdated: weather.lastUpdated),
                  FadeIn(
                    duration: const Duration(milliseconds: 600),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: CurrentWeatherCard(weather: weather, units: units),
                    ),
                  ),
                  SlideInUp(
                    duration: const Duration(milliseconds: 400),
                    delay: const Duration(milliseconds: 200),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: WeatherInfoTile(
                              icon: Icons.water_drop,
                              label: 'Humidity',
                              value: '${weather.humidity}%',
                            ),
                          ),
                          Expanded(
                            child: WeatherInfoTile(
                              icon: Icons.air,
                              label: 'Wind',
                              value: '${weather.windSpeed} m/s',
                            ),
                          ),
                          Expanded(
                            child: WeatherInfoTile(
                              icon: Icons.compress,
                              label: 'Pressure',
                              value: '${weather.pressure} hPa',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              loading: () => const WeatherShimmer(),
              error: (err, _) => SizedBox(
                height: 300,
                child: ErrorView(
                  message: err.toString(),
                  onRetry: () => ref.invalidate(currentWeatherProvider),
                ),
              ),
            ),
            const SizedBox(height: 16),
            forecastAsync.when(
              data: (forecasts) => FadeInUp(
                duration: const Duration(milliseconds: 400),
                delay: const Duration(milliseconds: 400),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('3-Hour Forecast',
                              style: Theme.of(context).textTheme.titleMedium),
                          TextButton(
                            onPressed: () => context.push('/hourly'),
                            child: const Text('See all'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 110,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        itemCount:
                            forecasts.length > 8 ? 8 : forecasts.length,
                        addAutomaticKeepAlives: false,
                        addRepaintBoundaries: true,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child:
                              HourlyForecastTile(forecast: forecasts[index]),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Daily Forecast',
                              style: Theme.of(context).textTheme.titleMedium),
                          TextButton(
                            onPressed: () => context.push('/daily'),
                            child: const Text('See all'),
                          ),
                        ],
                      ),
                    ),
                    ..._buildDailyPreview(forecasts),
                  ],
                ),
              ),
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildDailyPreview(List<Forecast> forecasts) {
    final Map<String, List<Forecast>> groups = {};
    for (final forecast in forecasts) {
      final key = DateFormat('yyyy-MM-dd').format(forecast.dateTime);
      groups.putIfAbsent(key, () => []).add(forecast);
    }

    return groups.entries.take(5).map((entry) {
      final dayForecasts = entry.value;
      final tempMin = dayForecasts
          .map((f) => f.temperature)
          .reduce((a, b) => a < b ? a : b);
      final tempMax = dayForecasts
          .map((f) => f.temperature)
          .reduce((a, b) => a > b ? a : b);
      final representative = dayForecasts.reduce((a, b) {
        final aDiff = (a.dateTime.hour - 12).abs();
        final bDiff = (b.dateTime.hour - 12).abs();
        return aDiff <= bDiff ? a : b;
      });

      final date = DateTime.parse(entry.key);
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final tomorrow = today.add(const Duration(days: 1));
      String dayLabel;
      if (date == today) {
        dayLabel = 'Today';
      } else if (date == tomorrow) {
        dayLabel = 'Tomorrow';
      } else {
        dayLabel = DateFormat('EEEE, MMM d').format(date);
      }

      return DailyForecastTile(
        dayLabel: dayLabel,
        forecast: representative,
        tempMin: tempMin,
        tempMax: tempMax,
      );
    }).toList();
  }
}
