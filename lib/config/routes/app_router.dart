import 'package:go_router/go_router.dart';
import 'package:kuwait_weather/presentation/screens/splash_screen.dart';
import 'package:kuwait_weather/presentation/screens/dashboard_screen.dart';
import 'package:kuwait_weather/presentation/screens/hourly_forecast_screen.dart';
import 'package:kuwait_weather/presentation/screens/daily_forecast_screen.dart';
import 'package:kuwait_weather/presentation/screens/location_screen.dart';
import 'package:kuwait_weather/presentation/screens/settings_screen.dart';

final appRouter = GoRouter(
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
