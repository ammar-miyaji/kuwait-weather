import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_providers.g.dart';

@riverpod
class TemperatureUnits extends _$TemperatureUnits {
  static const _key = 'temperature_units';

  @override
  String build() {
    _loadFromPrefs();
    return 'metric';
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_key);
    if (saved != null) {
      state = saved;
    }
  }

  Future<void> toggle() async {
    state = state == 'metric' ? 'imperial' : 'metric';
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, state);
  }
}
