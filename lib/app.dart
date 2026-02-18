import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kuwait_weather/config/routes/app_router.dart';
import 'package:kuwait_weather/config/theme/app_theme.dart';

class KuwaitWeatherApp extends ConsumerWidget {
  const KuwaitWeatherApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Kuwait Weather',
      theme: AppTheme.light,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
