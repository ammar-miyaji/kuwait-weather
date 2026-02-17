// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$remoteDataSourceHash() => r'0d32bc29be12da987c5b5e92d6888f63fac57c9c';

/// See also [remoteDataSource].
@ProviderFor(remoteDataSource)
final remoteDataSourceProvider =
    AutoDisposeProvider<WeatherRemoteDataSource>.internal(
      remoteDataSource,
      name: r'remoteDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$remoteDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RemoteDataSourceRef = AutoDisposeProviderRef<WeatherRemoteDataSource>;
String _$localDataSourceHash() => r'fa60577a63d879e06ba4a1c0eade595629425eab';

/// See also [localDataSource].
@ProviderFor(localDataSource)
final localDataSourceProvider =
    AutoDisposeProvider<WeatherLocalDataSource>.internal(
      localDataSource,
      name: r'localDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$localDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LocalDataSourceRef = AutoDisposeProviderRef<WeatherLocalDataSource>;
String _$weatherRepositoryHash() => r'97b8bad8cea356d19e90099d06f5a99b234eb49d';

/// See also [weatherRepository].
@ProviderFor(weatherRepository)
final weatherRepositoryProvider =
    AutoDisposeProvider<WeatherRepository>.internal(
      weatherRepository,
      name: r'weatherRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$weatherRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WeatherRepositoryRef = AutoDisposeProviderRef<WeatherRepository>;
String _$selectedCityHash() => r'74ec44c08aeddbafa67b12ee89d08d9279c6af84';

/// See also [selectedCity].
@ProviderFor(selectedCity)
final selectedCityProvider = AutoDisposeProvider<String>.internal(
  selectedCity,
  name: r'selectedCityProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedCityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SelectedCityRef = AutoDisposeProviderRef<String>;
String _$currentWeatherHash() => r'a2a7e2a3e2b7a9ada81b704d861af5261d937a4f';

/// See also [currentWeather].
@ProviderFor(currentWeather)
final currentWeatherProvider = AutoDisposeFutureProvider<Weather>.internal(
  currentWeather,
  name: r'currentWeatherProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentWeatherHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentWeatherRef = AutoDisposeFutureProviderRef<Weather>;
String _$forecastHash() => r'91ddf25380184d18c88a9064c2d93646487a908f';

/// See also [forecast].
@ProviderFor(forecast)
final forecastProvider = AutoDisposeFutureProvider<List<Forecast>>.internal(
  forecast,
  name: r'forecastProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$forecastHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ForecastRef = AutoDisposeFutureProviderRef<List<Forecast>>;
String _$temperatureUnitsHash() => r'd95e2a5e0255a935ead8a47da1c4bdd7c9fb5cd8';

/// See also [temperatureUnits].
@ProviderFor(temperatureUnits)
final temperatureUnitsProvider = AutoDisposeProvider<String>.internal(
  temperatureUnits,
  name: r'temperatureUnitsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$temperatureUnitsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TemperatureUnitsRef = AutoDisposeProviderRef<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
