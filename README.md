# country_search

Simple and fast country picker for Flutter.

[Live version](https://stanislavworldin.github.io/country_search/) · [pub.dev](https://pub.dev/packages/country_search) · [Repository](https://github.com/stanislavworldin/country_search) · [Issues](https://github.com/stanislavworldin/country_search/issues) · [Changelog](CHANGELOG.md) · [Migration](MIGRATION.md)

## What You Get

- 252+ countries (ISO code, emoji flag, phone code)
- Fast search by name, ISO code, and phone code
- 21 localizations
- Builder API for customization
- Standalone `CountryFlag` widget (emoji/svg)

## Supported Translation Languages

`ar` Arabic, `bn` Bengali, `de` German, `en` English, `es` Spanish, `fr` French, `hi` Hindi, `id` Indonesian, `it` Italian, `ja` Japanese, `ko` Korean, `nl` Dutch, `pl` Polish, `pt` Portuguese, `ru` Russian, `th` Thai, `tr` Turkish, `uk` Ukrainian, `ur` Urdu, `vi` Vietnamese, `zh` Chinese.

## Install

```yaml
dependencies:
  country_search: ^3.0.1
```

## 1-Minute Setup

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
);
```

```dart
CountryPicker.builder()
    .selectedCountry(selectedCountry)
    .onCountrySelected((country) {
      setState(() => selectedCountry = country);
    })
    .build();
```

## Most Used Options

```dart
CountryPicker.builder()
    .favorites(const ['US', 'GB'])
    .exclude(const ['RU'])
    .countryFilter((country) => country.code != 'KP')
    .onOpened(() {})
    .onClosed(() {})
    .onSearchChanged((query) {})
    .showSuggestedCountries(true)
    .modalPresentation(CountryPickerModalPresentation.dialog)
    .build();
```

## Styling (3.x)

In `3.x`, styling goes through `CountryPickerThemeData` only.

```dart
final theme = CountryPickerThemeData.light.copyWith(
  accentColor: Colors.blue,
  borderRadius: 12,
  itemHeight: 56,
);

CountryPicker.builder()
    .themeData(theme)
    .build();
```

Built-in presets:

- `CountryPickerThemeData.dark`
- `CountryPickerThemeData.light`
- `CountryPickerThemeData.purple`
- `CountryPickerThemeData.minimal`

## CountryFlag Widget

```dart
CountryFlag.fromCountryCode('US');

CountryFlag.fromCountryCode(
  'JP',
  mode: CountryFlagMode.svg,
  style: const CountryFlagStyle(size: 24, isCircle: true),
);
```

Lookup constructors:

- `CountryFlag.fromLanguageCode('pt-BR')`
- `CountryFlag.fromCurrencyCode('USD')`
- `CountryFlag.fromPhoneCode('+44')`

## Search Rules

- Empty query:
  - `showSuggestedCountries = true`: suggested + regular sections
  - `showSuggestedCountries = false`: regular list only
- Non-empty query ranking: exact -> startsWith -> contains -> fuzzy
- Accent-insensitive (`etats` finds `États-Unis`)
- Phone normalization (`+380`, `380`, `(+380)` work)

## Migration From 2.x

`3.0.0` removed legacy constructor style fields.
Use `themeData` for styling.

See [MIGRATION.md](MIGRATION.md).

## Compatibility

- Dart: `>=3.0.0 <4.0.0`
- Flutter: `>=3.0.0`

## Dev

```bash
flutter analyze
flutter test
```

## License

MIT. See [LICENSE](LICENSE).
