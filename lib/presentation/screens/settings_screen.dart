import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kuwait_weather/presentation/providers/settings_providers.dart';
import 'package:kuwait_weather/presentation/providers/weather_providers.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final units = ref.watch(temperatureUnitsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.thermostat),
            title: const Text('Temperature Units'),
            subtitle: Text(units == 'metric' ? 'Celsius (°C)' : 'Fahrenheit (°F)'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              ref.read(temperatureUnitsProvider.notifier).toggle();
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.delete_outline),
            title: const Text('Clear Cache'),
            subtitle: const Text('Remove all cached weather data'),
            onTap: () async {
              final confirmed = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Clear Cache?'),
                  content: const Text(
                      'This will remove all cached weather data. Fresh data will be fetched on next load.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('Cancel'),
                    ),
                    FilledButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('Clear'),
                    ),
                  ],
                ),
              );
              if (confirmed == true) {
                ref.invalidate(currentWeatherProvider);
                ref.invalidate(forecastProvider);
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Cache cleared')),
                  );
                }
              }
            },
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('About'),
            subtitle: Text('Kuwait Weather v1.0.0\nPowered by OpenWeatherMap'),
          ),
        ],
      ),
    );
  }
}
