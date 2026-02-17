import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kuwait_weather/app.dart';
import 'package:kuwait_weather/core/providers/hive_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  runApp(const ProviderScope(child: KuwaitWeatherApp()));
}
