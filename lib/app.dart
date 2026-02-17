import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kuwait_weather/core/theme/app_theme.dart';
import 'package:kuwait_weather/features/weather/presentation/screens/splash_screen.dart';
import 'package:kuwait_weather/features/weather/presentation/screens/dashboard_screen.dart';
import 'package:kuwait_weather/features/weather/presentation/screens/hourly_forecast_screen.dart';
import 'package:kuwait_weather/features/weather/presentation/screens/daily_forecast_screen.dart';
import 'package:kuwait_weather/features/location/presentation/screens/location_screen.dart';
import 'package:kuwait_weather/features/settings/presentation/screens/settings_screen.dart';

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardScreen()),
    GoRoute(
        path: '/hourly',
        builder: (context, state) => const HourlyForecastScreen()),
    GoRoute(
        path: '/daily',
        builder: (context, state) => const DailyForecastScreen()),
    GoRoute(
        path: '/location',
        builder: (context, state) => const LocationScreen()),
    GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen()),
  ],
);

class KuwaitWeatherApp extends ConsumerWidget {
  const KuwaitWeatherApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Kuwait Weather',
      theme: AppTheme.light,
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
