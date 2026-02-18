import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kuwait_weather/presentation/providers/location_providers.dart';
import 'package:kuwait_weather/presentation/providers/weather_providers.dart';

class LocationScreen extends ConsumerStatefulWidget {
  const LocationScreen({super.key});

  @override
  ConsumerState<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends ConsumerState<LocationScreen> {
  final _controller = TextEditingController();

  static const _suggestedCities = [
    'Kuwait City',
    'London',
    'Tokyo',
    'New York',
    'Dubai',
    'Paris',
    'Cairo',
    'Istanbul',
  ];

  void _selectCity(String city) {
    ref.read(selectedCityProvider.notifier).setCity(city);
    ref.read(recentCitiesProvider.notifier).addCity(city);
    ref.invalidate(currentWeatherProvider);
    ref.invalidate(forecastProvider);
    context.pop();
  }

  void _submitSearch() {
    final city = _controller.text.trim();
    if (city.isNotEmpty) {
      _selectCity(city);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedCity = ref.watch(selectedCityProvider);
    final recentCities = ref.watch(recentCitiesProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Select Location')),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _controller,
              textInputAction: TextInputAction.search,
              onSubmitted: (_) => _submitSearch(),
              decoration: InputDecoration(
                hintText: 'Search any city worldwide...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: _submitSearch,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          if (recentCities.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text('Recent', style: theme.textTheme.titleSmall),
            ),
            ...recentCities.map((city) => ListTile(
                  leading: const Icon(Icons.history),
                  title: Text(city),
                  trailing: city == selectedCity
                      ? Icon(Icons.check_circle,
                          color: theme.colorScheme.primary)
                      : null,
                  onTap: () => _selectCity(city),
                )),
            const Divider(),
          ],
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('Suggested', style: theme.textTheme.titleSmall),
          ),
          ..._suggestedCities.map((city) => ListTile(
                leading: const Icon(Icons.location_city),
                title: Text(city),
                trailing: city == selectedCity
                    ? Icon(Icons.check_circle,
                        color: theme.colorScheme.primary)
                    : null,
                onTap: () => _selectCity(city),
              )),
        ],
      ),
    );
  }
}
