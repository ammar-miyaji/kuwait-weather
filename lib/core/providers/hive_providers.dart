import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hive_providers.g.dart';

const String weatherBoxName = 'weather_cache';
const String forecastBoxName = 'forecast_cache';

@riverpod
Box<dynamic> weatherBox(ref) => Hive.box(weatherBoxName);

@riverpod
Box<dynamic> forecastBox(ref) => Hive.box(forecastBoxName);

Future<void> initHive() async {
  await Hive.initFlutter();
  await Hive.openBox(weatherBoxName);
  await Hive.openBox(forecastBoxName);
}
