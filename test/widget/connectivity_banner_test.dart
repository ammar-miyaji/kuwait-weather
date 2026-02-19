import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kuwait_weather/core/network/connectivity_provider.dart';
import 'package:kuwait_weather/presentation/widgets/common/connectivity_banner.dart';

void main() {
  group('ConnectivityBanner', () {
    testWidgets('shows nothing when online', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            isConnectedProvider.overrideWith((ref) => Future.value(true)),
            connectivityStreamProvider.overrideWith((ref) => Stream.value(true)),
          ],
          child: const MaterialApp(home: Scaffold(body: ConnectivityBanner())),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('No internet connection'), findsNothing);
      expect(find.byIcon(Icons.wifi_off_rounded), findsNothing);
    });

    testWidgets('shows offline banner when disconnected', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            isConnectedProvider.overrideWith((ref) => Future.value(false)),
            connectivityStreamProvider.overrideWith((ref) => Stream.value(false)),
          ],
          child: const MaterialApp(home: Scaffold(body: ConnectivityBanner())),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('No internet connection'), findsOneWidget);
      expect(find.byIcon(Icons.wifi_off_rounded), findsOneWidget);
    });

    testWidgets('banner appears when connectivity changes to offline', (tester) async {
      final controller = StreamController<bool>();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            isConnectedProvider.overrideWith((ref) => Future.value(true)),
            connectivityStreamProvider.overrideWith((ref) => controller.stream),
          ],
          child: const MaterialApp(home: Scaffold(body: ConnectivityBanner())),
        ),
      );
      await tester.pumpAndSettle();

      // Initially online — no banner
      expect(find.text('No internet connection'), findsNothing);

      // Go offline
      controller.add(false);
      await tester.pumpAndSettle();

      expect(find.text('No internet connection'), findsOneWidget);

      // Go back online
      controller.add(true);
      await tester.pumpAndSettle();

      expect(find.text('No internet connection'), findsNothing);

      await controller.close();
    });

    testWidgets('defaults to online while providers are loading', (tester) async {
      // Never-completing futures/streams simulate loading state
      final weatherCompleter = Completer<bool>();
      final streamController = StreamController<bool>();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            isConnectedProvider.overrideWith((ref) => weatherCompleter.future),
            connectivityStreamProvider.overrideWith((ref) => streamController.stream),
          ],
          child: const MaterialApp(home: Scaffold(body: ConnectivityBanner())),
        ),
      );
      await tester.pump();

      // Should not show banner while loading (defaults to online)
      expect(find.text('No internet connection'), findsNothing);

      await streamController.close();
    });
  });
}
