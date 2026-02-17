# Kuwait Weather

Offline-first weather dashboard for Kuwait, built with Flutter. Displays current conditions, 3-hour forecasts, and daily summaries using the OpenWeatherMap API. Works reliably without internet by caching data locally.

## Features

- **Current weather** — temperature, feels-like, humidity, wind speed, pressure
- **3-hour forecast** — scrollable list with 5-day/3-hour intervals
- **Daily forecast** — aggregated min/max temperatures per day
- **Location selection** — choose from 16 Kuwait areas
- **Offline-first** — cached data displayed when offline, with "Last updated" banner
- **Pull-to-refresh** — manual refresh of weather data
- **Settings** — temperature units, cache management

## Architecture

This project follows **Clean Architecture** with three layers per feature:

```
presentation → domain ← data
```

| Layer | Responsibility |
|-------|---------------|
| **Presentation** | Flutter widgets (`ConsumerWidget`), Riverpod providers |
| **Domain** | Pure Dart entities, abstract repository interfaces |
| **Data** | API calls (Dio), local cache (Hive), repository implementations |

### Key Decisions

- **Riverpod** for both state management and dependency injection — eliminates need for a separate DI container like GetIt. Providers form a dependency graph that Riverpod resolves automatically.
- **Hive** for local caching — lightweight NoSQL key-value store. Weather data is stored as serialized JSON with timestamps. Chose over Drift/SQLite because the data model is simple (no relational queries needed).
- **Freezed** for immutable models/entities — provides `copyWith`, value equality, and JSON serialization code generation.
- **Repository pattern** with separate `RemoteDataSource` and `LocalDataSource` — allows mocking at the data source level for tests and keeps offline-first logic isolated in the repository.
- **OpenWeatherMap 2.5 free tier** — two endpoints (`/weather` + `/forecast`) instead of the paid One Call API. "Hourly" forecast is actually 3-hour intervals.
- **GoRouter** for declarative navigation — type-safe routes, no imperative `Navigator.push`.

### Offline Strategy

1. On launch, check Hive cache for weather data
2. If cache exists and is fresh (< 30 min), return immediately
3. If cache is stale or missing, fetch from API
4. On fetch success, update cache and display
5. On fetch failure, fall back to stale cache (if available)
6. Display "Last updated: X min ago" banner when showing cached data

## Setup

### Prerequisites

- Flutter 3.38+ (`flutter --version`)
- An OpenWeatherMap API key (free tier)

### Get an API Key

1. Sign up at [openweathermap.org](https://openweathermap.org/appid)
2. Go to "API keys" in your account
3. Copy your key (it may take a few hours to activate)

### Run

```bash
git clone <repo-url>
cd kuwait_weather
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run --dart-define=OWM_API_KEY=your_api_key_here
```

### Test

```bash
flutter test
```

Tests include:
- **6 unit tests** — `WeatherRepositoryImpl` with mocked data sources (cache hit, cache miss, stale fallback, network failure)
- **3 widget tests** — `DashboardScreen` with provider overrides (data loaded, loading state, error state)

## Project Structure

```
lib/
├── main.dart                          # Entry point, Hive init, ProviderScope
├── app.dart                           # MaterialApp.router, GoRouter, theme
├── core/
│   ├── constants/api_constants.dart    # API URLs, cache duration
│   ├── error/                         # Exception and Failure types
│   ├── network/                       # Dio client, connectivity provider
│   ├── providers/                     # Hive box providers
│   └── theme/                         # App theme
├── features/
│   ├── weather/
│   │   ├── data/datasources/          # Remote (Dio) + Local (Hive)
│   │   ├── data/models/               # API DTOs (freezed + json)
│   │   ├── data/repositories/         # WeatherRepositoryImpl
│   │   ├── domain/entities/           # Weather, Forecast (freezed)
│   │   ├── domain/repositories/       # Abstract WeatherRepository
│   │   └── presentation/             # Screens, widgets, providers
│   ├── location/                      # Kuwait city selection
│   └── settings/                      # Units, cache management
└── shared/widgets/                    # ErrorView, LoadingIndicator
```

## Tech Stack

| Component | Technology |
|-----------|-----------|
| Framework | Flutter 3.38 / Dart 3.10 |
| State + DI | Riverpod 2.6 |
| HTTP | Dio |
| Cache | Hive |
| Models | Freezed + json_serializable |
| Navigation | GoRouter |
| Testing | flutter_test + mocktail |
