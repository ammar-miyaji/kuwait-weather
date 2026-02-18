import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kuwait_weather/core/network/connectivity_provider.dart';
import 'package:kuwait_weather/presentation/providers/location_providers.dart';
import 'package:kuwait_weather/presentation/providers/weather_providers.dart';
import 'package:kuwait_weather/presentation/widgets/common/connectivity_banner.dart';
import 'package:kuwait_weather/presentation/widgets/common/error_view.dart';
import 'package:kuwait_weather/presentation/widgets/common/weather_shimmer.dart';
import 'package:kuwait_weather/presentation/widgets/current_weather_card.dart';
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

    // Auto-refresh when coming back online
    ref.listen<AsyncValue<bool>>(connectivityStreamProvider, (prev, next) {
      next.whenData((isOnline) {
        final wasOffline = prev?.valueOrNull == false;
        if (isOnline && wasOffline) {
          ref.invalidate(currentWeatherProvider);
          ref.invalidate(forecastProvider);
        }
        if (context.mounted) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(isOnline ? 'Back online' : 'You are offline'),
              duration: const Duration(seconds: 2),
              backgroundColor: isOnline ? Colors.green : Colors.orange,
            ),
          );
        }
      });
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
                      child: CurrentWeatherCard(weather: weather),
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
}
