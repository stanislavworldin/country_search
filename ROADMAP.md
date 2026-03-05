# country_search Roadmap

## Strategy

- Keep `Builder + CountryPickerThemeData` as the primary API path.
- Add capability parity with top packages without growing API chaos.
- Keep backward compatibility through `2.x` and clean up in `3.0.0`.

## 2.9.1 (Short-Term) - Completed

Goal: close the biggest functional gaps with minimal API surface increase.

Scope:

- [x] Add favorites and exclusion:
  - `favorites` (priority block at top of list)
  - `exclude` (hard remove from data source)
- [x] Add custom filter callback:
  - `countryFilter` for product-specific restrictions.
- [x] Add lifecycle hooks:
  - `onOpened`, `onClosed`, `onSearchChanged`.
- [x] Add phone code exact-match helpers in data layer:
  - `findByPhoneCode`, `findAllByPhoneCode`.

Proposed API:

```dart
CountryPicker.builder()
    .favorites(const ['US', 'GB'])
    .exclude(const ['RU'])
    .countryFilter((country) => country.code != 'KP')
    .onOpened(() {})
    .onClosed(() {})
    .onSearchChanged((query) {})
    .build();
```

Acceptance criteria:

- Unit tests for priority order: `favorites -> suggested -> regular`.
- Unit tests for `exclude` + `countryFilter` composition.
- Widget tests for lifecycle hooks and search callback firing.
- No regressions in existing search ranking behavior.

## 2.10.0 (Mid-Term) - In Progress

Goal: improve extensibility and UX control.

Scope:

- [x] Add rendering slots:
  - `itemBuilder`
  - `emptySearchBuilder`
  - `modalHeaderBuilder`.
- [x] Add modal behavior controls:
  - `useRootNavigator`
  - `bottomSheetWidth`
  - `moveAlongWithKeyboard`.
- [x] Add search normalization layer:
  - accent-insensitive matching
  - stronger normalization for phone queries.
- [ ] Expand localization coverage from current set to top-demand languages.

Proposed API:

```dart
CountryPicker.builder()
    .itemBuilder((context, country, isSelected, onSelect, defaultItem) => ...)
    .emptySearchBuilder((context, query) => ...)
    .modalHeaderBuilder((context, defaultHeader) => defaultHeader)
    .useRootNavigator(true)
    .bottomSheetWidth(560)
    .moveAlongWithKeyboard(true)
    .build();
```

Acceptance criteria:

- [x] Widget tests for custom item/header/empty builders.
- [x] Search tests for accents and phone normalization.
- [ ] Integration tests for keyboard + modal behavior.

## 2.11.0 (Module Expansion)

Goal: add a first-class flag subsystem inspired by strengths of `country_flags`.

Scope:

- Introduce `CountryFlag` widget and helpers:
  - emoji mode
  - svg mode
  - configurable shape/theme via a small style object.
- Add utility lookups:
  - `fromLanguageCode`
  - `fromCurrencyCode`
  - `fromPhoneCode`.
- Keep it optional for consumers that only need picker core.

Proposed API:

```dart
CountryFlag.fromCountryCode(
  'US',
  mode: CountryFlagMode.svg,
  style: const CountryFlagStyle(size: 20, isCircle: true),
)
```

Acceptance criteria:

- Snapshot tests for emoji/svg modes.
- Fallback behavior tests when svg asset is unavailable.
- No additional runtime cost for apps not using `CountryFlag`.

## 3.0.0 (Cleanup)

Goal: complete API simplification and remove long-lived duplication.

Scope:

- Remove deprecated constructor styling fields.
- Keep a single styling path via `CountryPickerThemeData`.
- Keep Builder as canonical integration path.
- Publish full migration guide with codemod suggestions.

Acceptance criteria:

- Deprecation warnings shipped in `2.x` before removal.
- Migration doc examples for all removed fields.
- Stable tests and benchmark parity with `2.11.x`.

## Deprecation Timeline

- `2.9.1`: mark legacy style fields as deprecated in docs.
- `2.10.0`: add runtime/assert hints in debug mode for legacy usage.
- `2.11.0`: finalize migration docs and examples.
- `3.0.0`: remove legacy style fields.

## Engineering Backlog (Cross-Cutting)

- Add benchmark suite for search latency and memory churn.
- Add CI matrix across recent stable Flutter channels.
- Add API docs pages for Builder, ThemeData, and search internals.
- Add release checklist template (`analyze`, `test`, `publish --dry-run`, changelog sync).

## Suggested Delivery Order

1. `2.9.1`: favorites/exclude/filter + hooks + phone helpers.
2. `2.10.0`: rendering slots + modal controls + search normalization.
3. `2.11.0`: `CountryFlag` module.
4. `3.0.0`: remove legacy API.
