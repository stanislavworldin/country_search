# country_search

A Flutter country picker with fast search, localization, and flexible UI customization.

## Features

- 250+ countries with ISO code, flag emoji, and phone code.
- Search by localized country name, ISO code, and phone code.
- Search result priority: exact match, prefix match, contains match, fuzzy match.
- Locale-driven suggested countries.
- Two presentation modes: bottom sheet and centered dialog.
- Constructor API and fluent Builder API.
- 19 built-in localizations.

## Compatibility

- Declared constraints:
  - Dart: `>=3.0.0 <4.0.0`
  - Flutter: `>=3.0.0`
- Last verified on:
  - Flutter `3.41.2`
  - Dart `3.11.0`
  - Date: March 3, 2026

## Installation

```yaml
dependencies:
  country_search: ^2.8.6
```

## Quick Start

```dart
import 'package:country_search/country_search.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  Country? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        CountryLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: CountryLocalizations.supportedLocales,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: CountryPicker(
            selectedCountry: selectedCountry,
            onCountrySelected: (country) {
              setState(() {
                selectedCountry = country;
              });
            },
          ),
        ),
      ),
    );
  }
}
```

## Builder API

```dart
CountryPicker.builder()
    .selectedCountry(selectedCountry)
    .onCountrySelected((country) => setState(() => selectedCountry = country))
    .build();
```

Use dialog presentation instead of bottom sheet:

```dart
CountryPicker.builder()
    .selectedCountry(selectedCountry)
    .onCountrySelected((country) => setState(() => selectedCountry = country))
    .modalPresentation(CountryPickerModalPresentation.dialog)
    .build();
```

## Localization

Supported language codes:
`ar`, `de`, `en`, `es`, `fr`, `hi`, `id`, `it`, `ja`, `ko`, `nl`, `pl`, `pt`, `ru`, `th`, `tr`, `uk`, `vi`, `zh`.

Get a localized country name:

```dart
Text(country.getDisplayName(context))
```

## Search Behavior

- Empty query:
  - with `showSuggestedCountries = true`: suggested section + full alphabetical list.
  - with `showSuggestedCountries = false`: full alphabetical list.
- Non-empty query:
  - search runs over base countries only.
  - result ordering is by relevance group, then alphabetically inside each group:
    1. exact
    2. starts with
    3. contains
    4. fuzzy
- Phone code normalization:
  - both `+380` and `380` formats are supported.

## API Reference

`CountryPicker` main parameters:

| Parameter | Type | Default | Notes |
| --- | --- | --- | --- |
| `selectedCountry` | `Country?` | `null` | Current selection |
| `onCountrySelected` | `ValueChanged<Country>` | required | Selection callback |
| `labelText` | `String?` | `null` | Label above picker |
| `hintText` | `String?` | localized | Placeholder text |
| `showPhoneCodes` | `bool` | `true` | Show phone code in rows |
| `showCountryCodes` | `bool` | `true` | Show ISO codes |
| `showFlags` | `bool` | `true` | Show flag emojis |
| `itemHeight` | `double?` | `56.0` | Ignored when `adaptiveHeight=true` |
| `adaptiveHeight` | `bool` | `false` | Row height based on content |
| `itemPadding` | `EdgeInsets?` | `h:12, v:8` | Row inner padding |
| `flagSize` | `double?` | `20.0` | Flag text size |
| `showSuggestedCountries` | `bool` | `true` | Locale-based suggested section |
| `modalPresentation` | `CountryPickerModalPresentation` | `bottomSheet` | `bottomSheet` or `dialog` |
| `backgroundColor` | `Color?` | theme default | Modal background |
| `headerColor` | `Color?` | theme default | Header background |
| `textColor` | `Color?` | theme default | Primary text |
| `accentColor` | `Color?` | theme default | Selection and accents |
| `searchFieldColor` | `Color?` | theme default | Search field background |
| `searchFieldBorderColor` | `Color?` | theme default | Search field border |
| `cursorColor` | `Color?` | theme default | Search cursor color |
| `hintTextColor` | `Color?` | theme default | Hint and secondary text |
| `hoverColor` | `Color?` | theme default | Row hover color |
| `borderRadius` | `double?` | `8.0` | Picker and modal radius |
| `textStyle` | `TextStyle?` | `fontSize:14` | Row base text style |

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

Important for `2.8.6`:

- Callback type is now explicitly `ValueChanged<Country>`.
- Tooling/lints updated to `flutter_lints ^6.0.0`.

## Performance Notes

- Country lookups by ISO/phone code are O(1) via prebuilt maps.
- Search uses grouped ranking and caches localized names per query.
- Fuzzy matching uses an optimized Levenshtein implementation with early exit.
- Suggested/regular sections for empty query are precomputed per locale update.

## Known Limitations

- Country and localization data are bundled statically in the package.
- Suggested countries are based on language heuristics, not user geolocation.
- With suggestions enabled and empty query, a country may appear in both suggested and regular sections by design.

## Troubleshooting

### Country names are not localized

Ensure delegates are configured in `MaterialApp`:

```dart
localizationsDelegates: const [
  CountryLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
],
supportedLocales: CountryLocalizations.supportedLocales,
```

### Search by phone code returns unexpected ordering

This is expected when multiple countries share the same dialing code (for example `+1`).
Ordering follows relevance, then alphabetical localized name.

### Build error related to color APIs in older Flutter

Upgrade Flutter to a recent stable version and run:

```bash
flutter clean
flutter pub get
```

## Development

Local verification commands:

```bash
flutter analyze
flutter test
```

## License

MIT. See [LICENSE](LICENSE).
