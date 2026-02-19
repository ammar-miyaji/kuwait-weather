import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kuwait_weather/domain/entities/forecast.dart';
import 'package:kuwait_weather/presentation/providers/weather_providers.dart';
import 'package:kuwait_weather/presentation/widgets/common/error_view.dart';
import 'package:kuwait_weather/presentation/widgets/common/loading_indicator.dart';
import 'package:kuwait_weather/presentation/widgets/common/weather_icon.dart';

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
            return FadeInLeft(
              duration: const Duration(milliseconds: 300),
              delay: Duration(milliseconds: 50 * index),
              child: _HourlyListTile(forecast: forecast),
            );
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
      leading: WeatherIcon(
        iconCode: forecast.iconCode,
        size: 40,
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
