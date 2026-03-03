# Migration Guide

## Upgrade to 2.9.0

Version `2.9.0` introduces API simplification and performance-focused improvements.

## What changed

- Stronger callback typing in public API:
  - `onCountrySelected` now uses `ValueChanged<Country>`.
- New unified styling object:
  - `CountryPickerThemeData` for visual customization in one place.
- Builder now supports `.themeData(...)` for theme-driven configuration.
- Internal search and lookup optimizations.
- Dev tooling update to `flutter_lints ^6.0.0`.

## Breaking changes

No functional runtime breaking changes are expected for normal usage.

If your code explicitly typed callback signatures as `Function(Country)`, update to `ValueChanged<Country>`.

Before:

```dart
final Function(Country) onCountrySelected;
```

After:

```dart
final ValueChanged<Country> onCountrySelected;
```

If you previously passed many separate style fields, move them into one theme object.

Before:

```dart
CountryPicker.builder()
    .backgroundColor(Colors.white)
    .headerColor(const Color(0xFFF5F5F5))
    .accentColor(Colors.blue)
    .borderRadius(12)
    .build();
```

After:

```dart
final theme = CountryPickerThemeData.light.copyWith(
  accentColor: Colors.blue,
  borderRadius: 12,
);

CountryPicker.builder()
    .themeData(theme)
    .build();
```

## Recommended upgrade steps

1. Update dependency:

```yaml
dependencies:
  country_search: ^2.9.0
```

2. Fetch packages:

```bash
flutter pub get
```

3. Run checks:

```bash
flutter analyze
flutter test
```

4. Verify behavior manually:

- Empty search mode (suggested + regular sections).
- Phone code search with and without `+`.
- Dialog and bottom-sheet presentations.
- Localization in your target locales.

## Notes for contributors

If you contribute to this package, ensure your environment uses a recent stable Flutter/Dart toolchain and `flutter_lints ^6.0.0`.
