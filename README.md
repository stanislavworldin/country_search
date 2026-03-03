# country_search

A Flutter country picker with fast search, localization, and flexible UI.

## Installation

```yaml
dependencies:
  country_search: ^2.9.0
```

## Quick Setup

```dart
import 'package:country_search/country_search.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

MaterialApp(
  localizationsDelegates: const [
    CountryLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: CountryLocalizations.supportedLocales,
  home: const DemoPage(),
)
```

## Basic (Recommended)

Use the Builder API for all new code.

```dart
CountryPicker.builder()
    .selectedCountry(selectedCountry)
    .onCountrySelected((country) {
      setState(() => selectedCountry = country);
    })
    .build();
```

## Advanced (Recommended)

Use a single `CountryPickerThemeData` object instead of many separate style params.

```dart
final pickerTheme = CountryPickerThemeData.light.copyWith(
  accentColor: const Color(0xFF1565C0),
  borderRadius: 12,
  itemHeight: 56,
  flagSize: 20,
);

CountryPicker.builder()
    .selectedCountry(selectedCountry)
    .onCountrySelected((country) {
      setState(() => selectedCountry = country);
    })
    .themeData(pickerTheme)
    .modalPresentation(CountryPickerModalPresentation.dialog)
    .showSuggestedCountries(true)
    .build();
```

### Built-in Theme Presets

- `CountryPickerThemeData.dark`
- `CountryPickerThemeData.light`
- `CountryPickerThemeData.purple`
- `CountryPickerThemeData.minimal`

Builder helpers are also available:

- `.darkTheme()`
- `.lightTheme()`
- `.purpleTheme()`
- `.minimalTheme()`

## Legacy API (Backward Compatible)

The constructor with individual style fields is still supported for compatibility,
but new code should prefer Builder + `themeData`.

```dart
CountryPicker(
  selectedCountry: selectedCountry,
  onCountrySelected: (country) {
    setState(() => selectedCountry = country);
  },
  backgroundColor: Colors.white,
  accentColor: Colors.blue,
)
```

## Search Behavior

- Empty query:
  - `showSuggestedCountries = true`: suggested section + full list.
  - `showSuggestedCountries = false`: full list.
- Non-empty query:
  - Search by localized name, ISO code, phone code.
  - Ranking: exact, startsWith, contains, fuzzy.
- Phone code normalization:
  - `+380` and `380` both work.

## Country Model

```dart
class Country {
  final String code;      // Example: "US"
  final String flag;      // Example: "🇺🇸"
  final String phoneCode; // Example: "+1"

  String getDisplayName(BuildContext context);
}
```

## Migration

See [MIGRATION.md](MIGRATION.md).

## Compatibility

- Dart: `>=3.0.0 <4.0.0`
- Flutter: `>=3.0.0`

## Development

```bash
flutter analyze
flutter test
```

## License

MIT. See [LICENSE](LICENSE).
