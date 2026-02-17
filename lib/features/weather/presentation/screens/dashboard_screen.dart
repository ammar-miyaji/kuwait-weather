import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kuwait_weather/features/weather/presentation/providers/weather_providers.dart';
import 'package:kuwait_weather/features/weather/presentation/widgets/current_weather_card.dart';
import 'package:kuwait_weather/features/weather/presentation/widgets/last_updated_banner.dart';
import 'package:kuwait_weather/features/weather/presentation/widgets/weather_info_tile.dart';
import 'package:kuwait_weather/features/weather/presentation/widgets/hourly_forecast_tile.dart';
import 'package:kuwait_weather/shared/widgets/error_view.dart';
import 'package:kuwait_weather/shared/widgets/loading_indicator.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherAsync = ref.watch(currentWeatherProvider);
    final forecastAsync = ref.watch(forecastProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kuwait Weather'),
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
            weatherAsync.when(
              data: (weather) => Column(
                children: [
                  LastUpdatedBanner(lastUpdated: weather.lastUpdated),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: CurrentWeatherCard(weather: weather),
                  ),
                  Padding(
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
                ],
              ),
              loading: () => const SizedBox(
                height: 300,
                child: LoadingIndicator(message: 'Loading weather...'),
              ),
              error: (err, _) => SizedBox(
                height: 300,
                child: ErrorView(
                  message: err.toString(),
                  onRetry: () => ref.invalidate(currentWeatherProvider),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Hourly forecast preview
            forecastAsync.when(
              data: (forecasts) => Column(
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
                      itemCount: forecasts.length > 8 ? 8 : forecasts.length,
                      addAutomaticKeepAlives: false,
                      addRepaintBoundaries: true,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: HourlyForecastTile(forecast: forecasts[index]),
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
                ],
              ),
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
