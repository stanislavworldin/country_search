# country_search

Technical documentation for the Flutter country picker.

## Installation

```yaml
dependencies:
  country_search: ^2.8.6
```

## Basic usage

```dart
import 'package:country_search/country_search.dart';

CountryPicker(
  selectedCountry: selectedCountry,
  onCountrySelected: (Country country) {
    setState(() {
      selectedCountry = country;
    });
  },
);
```

## Builder API

```dart
CountryPicker.builder()
    .selectedCountry(selectedCountry)
    .onCountrySelected((country) => setState(() => selectedCountry = country))
    .build();
```

Dialog presentation instead of bottom sheet:

```dart
CountryPicker.builder()
    .selectedCountry(selectedCountry)
    .onCountrySelected((c) => setState(() => selectedCountry = c))
    .modalPresentation(CountryPickerModalPresentation.dialog)
    .build();
```

## Localization

```dart
MaterialApp(
  localizationsDelegates: [
    CountryLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: const [
    Locale('en'),
    Locale('de'),
    Locale('ru'),
    // add others as needed
  ],
);
```

Get a localized country name:

```dart
Text(country.getDisplayName(context))
```

## API summary

- selectedCountry: Country?
- onCountrySelected: Function(Country) — required
- labelText: String?
- hintText: String?
- showPhoneCodes: bool = true
- showCountryCodes: bool = true
- showFlags: bool = true
- textStyle: TextStyle?
- itemHeight: double = 56.0
- itemPadding: EdgeInsets? (horizontal 12, vertical 8)
- flagSize: double = 20.0
- backgroundColor: Color?
- headerColor: Color?
- textColor: Color?
- accentColor: Color?
- searchFieldColor: Color?
- searchFieldBorderColor: Color?
- cursorColor: Color?
- hintTextColor: Color?
- hoverColor: Color?
- borderRadius: double = 8.0
- adaptiveHeight: bool = false
- showSuggestedCountries: bool = true
- modalPresentation: CountryPickerModalPresentation = bottomSheet

## Country model

```dart
class Country {
  final String code;      // e.g. "US"
  final String flag;      // e.g. "🇺🇸"
  final String phoneCode; // e.g. "+1"

  String getDisplayName(BuildContext context);
}
```

## License

MIT — see `LICENSE`.
