# Migration Guide

## Upgrade to 3.0.0

`3.0.0` is a cleanup release.
Main change: style customization is now **theme-only**.

## Breaking Change

Removed from `CountryPicker(...)` constructor:

- `backgroundColor`
- `headerColor`
- `textColor`
- `accentColor`
- `searchFieldColor`
- `searchFieldBorderColor`
- `cursorColor`
- `hintTextColor`
- `hoverColor`
- `borderRadius`
- `textStyle`
- `itemHeight`
- `itemPadding`
- `flagSize`

## What To Do

Move these style values to `themeData: CountryPickerThemeData...copyWith(...)`.

Before (`2.x`):

```dart
CountryPicker(
  selectedCountry: selectedCountry,
  onCountrySelected: onCountrySelected,
  backgroundColor: Colors.white,
  accentColor: Colors.blue,
  borderRadius: 12,
  itemHeight: 56,
);
```

After (`3.x`):

```dart
CountryPicker(
  selectedCountry: selectedCountry,
  onCountrySelected: onCountrySelected,
  themeData: CountryPickerThemeData.light.copyWith(
    backgroundColor: Colors.white,
    accentColor: Colors.blue,
    borderRadius: 12,
    itemHeight: 56,
  ),
);
```

## Builder Example

```dart
CountryPicker.builder()
    .selectedCountry(selectedCountry)
    .onCountrySelected(onCountrySelected)
    .themeData(
      CountryPickerThemeData.light.copyWith(
        accentColor: Colors.blue,
        borderRadius: 12,
      ),
    )
    .build();
```

## Quick Check Command

```bash
rg -n "backgroundColor:|headerColor:|textColor:|accentColor:|searchFieldColor:|searchFieldBorderColor:|cursorColor:|hintTextColor:|hoverColor:|borderRadius:|textStyle:|itemHeight:|itemPadding:|flagSize:" lib test example
```
