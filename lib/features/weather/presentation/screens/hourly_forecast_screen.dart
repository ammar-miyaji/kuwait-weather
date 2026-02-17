import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kuwait_weather/core/constants/api_constants.dart';
import 'package:kuwait_weather/features/weather/domain/entities/forecast.dart';
import 'package:kuwait_weather/features/weather/presentation/providers/weather_providers.dart';
import 'package:kuwait_weather/shared/widgets/error_view.dart';
import 'package:kuwait_weather/shared/widgets/loading_indicator.dart';

class HourlyForecastScreen extends ConsumerWidget {
  const HourlyForecastScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forecastAsync = ref.watch(forecastProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('3-Hour Forecast')),
      body: forecastAsync.when(
        data: (forecasts) => ListView.builder(
          itemCount: forecasts.length,
          itemBuilder: (context, index) {
            final forecast = forecasts[index];
            return _HourlyListTile(forecast: forecast);
          },
        ),
        loading: () => const LoadingIndicator(message: 'Loading forecast...'),
        error: (err, _) => ErrorView(
          message: err.toString(),
          onRetry: () => ref.invalidate(forecastProvider),
        ),
      ),
    );
  }
}

class _HourlyListTile extends StatelessWidget {
  final Forecast forecast;

  const _HourlyListTile({required this.forecast});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Image.network(
        ApiConstants.iconUrl(forecast.iconCode),
        width: 40,
        height: 40,
        cacheWidth: 80,
        cacheHeight: 80,
        gaplessPlayback: true,
        errorBuilder: (_, __, ___) => const Icon(Icons.cloud, size: 40),
      ),
      title: Text(DateFormat('EEE, MMM d  HH:mm').format(forecast.dateTime)),
      subtitle: Text(
        forecast.description[0].toUpperCase() +
            forecast.description.substring(1),
      ),
      trailing: Text(
        '${forecast.temperature.round()}°',
        style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
