# Kuwait Weather

Offline-first weather dashboard built with Flutter. Displays current conditions, 3-hour forecasts, and daily summaries for any city worldwide using the OpenWeatherMap API. Works reliably without internet by caching data locally.

## Features

- **Current weather** — temperature, feels-like, humidity, wind speed, pressure with gradient weather cards
- **3-hour forecast** — scrollable list with 5-day/3-hour intervals and staggered animations
- **Daily forecast** — aggregated min/max temperatures per day
- **Worldwide location** — search any city worldwide with recent cities history
- **Offline-first** — cached data displayed when offline, connectivity banner, auto-refresh on reconnect
- **Pull-to-refresh** — manual refresh of weather data
- **Smooth animations** — entrance animations, shimmer loading skeletons, page transitions
- **Settings** — temperature units (metric/imperial), cache management

## Architecture

This project follows **Clean Architecture** with a layer-first structure:

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
7. Show connectivity banner when offline ("Offline — Showing cached data")
8. Auto-refresh weather data when connectivity is restored

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
├── app.dart                           # MaterialApp.router setup
├── config/
│   ├── routes/app_router.dart         # GoRouter configuration
│   └── theme/app_theme.dart           # Theme + weather gradients
├── core/
│   ├── api/dio_client.dart            # Dio HTTP client provider
│   ├── constants/api_constants.dart   # API URLs, cache duration
│   ├── error/                         # Exception and Failure types
│   ├── network/                       # Connectivity provider (stream-based)
│   └── services/hive_service.dart     # Hive box providers
├── data/
│   ├── datasources/                   # Remote (Dio) + Local (Hive)
│   ├── models/                        # API DTOs (freezed + json)
│   └── repositories/                  # WeatherRepositoryImpl
├── domain/
│   ├── entities/                      # Weather, Forecast (freezed)
│   └── repositories/                  # Abstract WeatherRepository
└── presentation/
    ├── providers/                     # Weather, location, settings providers
    ├── screens/                       # Dashboard, forecasts, location, settings, splash
    └── widgets/
        ├── common/                    # ErrorView, LoadingIndicator, WeatherShimmer, ConnectivityBanner
        ├── current_weather_card.dart  # Gradient weather card
        ├── daily_forecast_tile.dart   # Daily forecast list item
        ├── hourly_forecast_tile.dart  # Hourly forecast item
        ├── last_updated_banner.dart   # Cache age indicator
        └── weather_info_tile.dart     # Weather detail tile
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
| Animations | animate_do + shimmer |
| Connectivity | connectivity_plus |
| Testing | flutter_test + mocktail |
