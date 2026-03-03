# Migration Guide

## Upgrade to 2.8.6

Version `2.8.6` is a maintenance and performance-focused release.

## What changed

- Stronger callback typing in public API:
  - `onCountrySelected` now uses `ValueChanged<Country>`.
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

## Recommended upgrade steps

1. Update dependency:

```yaml
dependencies:
  country_search: ^2.8.6
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
