import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kuwait_weather/features/location/data/kuwait_locations.dart';
import 'package:kuwait_weather/features/weather/presentation/providers/weather_providers.dart';

class LocationScreen extends ConsumerStatefulWidget {
  const LocationScreen({super.key});

  @override
  ConsumerState<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends ConsumerState<LocationScreen> {
  String _searchQuery = '';

  List<String> get _filteredCities {
    if (_searchQuery.isEmpty) return KuwaitLocations.cities;
    return KuwaitLocations.cities
        .where((c) => c.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final selectedCity = ref.watch(selectedCityProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Select Location')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search locations...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) => setState(() => _searchQuery = value),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredCities.length,
              itemBuilder: (context, index) {
                final city = _filteredCities[index];
                final isSelected = city == selectedCity;
                return ListTile(
                  title: Text(city),
                  trailing: isSelected
                      ? Icon(Icons.check_circle,
                          color: Theme.of(context).colorScheme.primary)
                      : null,
                  onTap: () {
                    ref.invalidate(selectedCityProvider);
                    // Override not possible with generated providers directly,
                    // so we navigate back and let the dashboard refresh
                    ref.invalidate(currentWeatherProvider);
                    ref.invalidate(forecastProvider);
                    context.pop();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
