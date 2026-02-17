import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kuwait_weather/features/weather/domain/entities/weather.dart';
import 'package:kuwait_weather/features/weather/domain/entities/forecast.dart';
import 'package:kuwait_weather/features/weather/presentation/providers/weather_providers.dart';
import 'package:kuwait_weather/features/weather/presentation/screens/dashboard_screen.dart';

import '../helpers/fixtures.dart';

void main() {
  group('DashboardScreen', () {
    testWidgets('displays weather data when loaded', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            currentWeatherProvider.overrideWith((ref) => Future.value(testWeather)),
            forecastProvider.overrideWith((ref) => Future.value(testForecasts)),
          ],
          child: const MaterialApp(home: DashboardScreen()),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Kuwait City'), findsOneWidget);
      expect(find.text('42°'), findsOneWidget);
      expect(find.text('Clear sky'), findsOneWidget);
    });

    testWidgets('displays loading indicator while fetching', (tester) async {
      final weatherCompleter = Completer<Weather>();
      final forecastCompleter = Completer<List<Forecast>>();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            currentWeatherProvider
                .overrideWith((ref) => weatherCompleter.future),
            forecastProvider
                .overrideWith((ref) => forecastCompleter.future),
          ],
          child: const MaterialApp(home: DashboardScreen()),
        ),
      );
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('displays error view on failure', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            currentWeatherProvider.overrideWith((ref) => Future<Weather>.error('API Error')),
            forecastProvider
                .overrideWith((ref) => Future<List<Forecast>>.error('API Error')),
          ],
          child: const MaterialApp(home: DashboardScreen()),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Retry'), findsOneWidget);
    });
  });
}
