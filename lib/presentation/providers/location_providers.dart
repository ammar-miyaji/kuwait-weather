import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'location_providers.g.dart';

@riverpod
class SelectedCity extends _$SelectedCity {
  static const _key = 'selected_city';

  @override
  String build() {
    _loadFromPrefs();
    return 'Kuwait City';
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_key);
    if (saved != null && saved.isNotEmpty) {
      state = saved;
    }
  }

  Future<void> setCity(String city) async {
    state = city;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, city);
  }
}

@riverpod
class RecentCities extends _$RecentCities {
  static const _key = 'recent_cities';
  static const _maxRecent = 10;

  @override
  List<String> build() {
    _loadFromPrefs();
    return [];
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList(_key);
    if (saved != null) {
      state = saved;
    }
  }

  Future<void> addCity(String city) async {
    final updated = [city, ...state.where((c) => c != city)]
        .take(_maxRecent)
        .toList();
    state = updated;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_key, updated);
  }
}
