import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kuwait_weather/app.dart';
import 'package:kuwait_weather/core/services/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await initHive();
  runApp(const ProviderScope(child: KuwaitWeatherApp()));
}
