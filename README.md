# country_search 🚀

> **The Fastest, Most Customizable Country Picker for Flutter**

[![Pub](https://img.shields.io/pub/v/country_search.svg)](https://pub.dev/packages/country_search)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/stanislavworldin/country_search/blob/main/LICENSE)
[![Flutter](https://img.shields.io/badge/flutter-%E2%89%A53.0-blue?logo=flutter)](https://flutter.dev)

**🌐 Live Demo:** [View on GitHub Pages](https://stanislavworldin.github.io/country_search/)

![Country Picker Demo](https://raw.githubusercontent.com/stanislavworldin/country_search/main/screenshots/0.gif)

## ⭐ Why Choose country_search?

- 🌍 **252+ Countries** - Complete ISO 3166-1 standard with flags, codes & phone numbers
- ⚡ **Blazing Fast** - Search in 110μs, optimized for weak devices
- 🎨 **Fully Customizable** - Colors, sizes, styles, themes - you name it!
- 🌐 **19 Languages** - Automatic localization with fallback
- 🧩 **Zero Config** - Works out of the box, just 1 line of code
- 📱 **Responsive** - Perfect on mobile, tablet & desktop

### ⚡ Smart Search
- **Fuzzy search** - find countries even with typos
- **Multi-field search** - by name, code, or phone
- **Instant results** - 110μs per query
- **Real-time filtering** - as you type

### 🌓 Theme Support
- **Dark theme** - Beautiful default dark design
- **Light theme** - Clean light appearance
- **Custom themes** - Any color combination
- **Responsive** - Adapts to any screen size

## 📊 Comparison with Competitors

| Feature | country_search 2.7.1 | country_code_picker | country_picker |
|---------|---------------------|-------------------|----------------------|
| **Builder API** | ✅ Available | ❌ Not available | ❌ Not available |
| **Pre-built Themes** | ✅ Available | ❌ Not available | ❌ Not available |
| **Fuzzy Search** | ✅ Available | ❌ Not available | ❌ Not available |
| **252 Countries** | ✅ Available | ❌ Not available | ❌ Not available |
| **Customizable UI** | ✅ Advanced | ⚠️ Limited | ⚠️ Limited |
| **Performance** | ⚡ 110μs search | 🐌 Slower | 🐌 Slower |
| **Package Size** | 📦 ~113KB | 📦 Larger | 📦 Larger |




## 🚀 Quick Start


Add to your `pubspec.yaml`:

```yaml
dependencies:
  country_search: ^2.7.1
```

```dart
import 'package:country_search/country_search.dart';

CountryPicker(
  selectedCountry: selectedCountry,
  onCountrySelected: (Country country) {
    setState(() {
      selectedCountry = country;
    });
  },
)
```

**That's it!** Your country picker is ready to use. 🎉




## 📱 Screenshots

![Dark Theme](https://raw.githubusercontent.com/stanislavworldin/country_search/main/screenshots/1.png)
![Chinese Language](https://raw.githubusercontent.com/stanislavworldin/country_search/main/screenshots/2.png)



### Builder API Examples
```dart
// Basic Builder API
CountryPicker.builder()
    .selectedCountry(selectedCountry)
    .onCountrySelected((country) => setState(() => selectedCountry = country))
    .build();

// With pre-built themes
CountryPicker.builder()
    .selectedCountry(selectedCountry)
    .onCountrySelected((country) => setState(() => selectedCountry = country))
    .darkTheme()  // or .lightTheme(), .purpleTheme(), .minimalTheme()
    .build();

// Custom configuration
CountryPicker.builder()
    .selectedCountry(selectedCountry)
    .onCountrySelected((country) => setState(() => selectedCountry = country))
    .lightTheme()
    .itemHeight(72.0)
    .flagSize(28.0)
    .textStyle(const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))
    .showCountryCodes(false)
    .build();

// Adaptive height (content-based sizing)
CountryPicker.builder()
    .selectedCountry(selectedCountry)
    .onCountrySelected((country) => setState(() => selectedCountry = country))
    .adaptiveHeight(true)
    .build();
```

### Display Country Name
```dart
// Get localized country name
Text(country.getDisplayName(context))
```



## 🌐 Multi-language Support

The widget automatically detects your app's language. Add localization delegates:

```dart
MaterialApp(
  locale: const Locale('de'), // Your app's language
  localizationsDelegates: [
    CountryLocalizations.delegate, // Our country picker localization
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: [
    const Locale('en'),
    const Locale('de'),
    const Locale('ru'),
    // Add your languages
  ],
)
```

**Supported Languages:** 🇺🇸 English, 🇷🇺 Russian, 🇪🇸 Spanish, 🇫🇷 French, 🇩🇪 German, 🇮🇹 Italian, 🇯🇵 Japanese, 🇰🇷 Korean, 🇵🇹 Portuguese, 🇨🇳 Chinese, 🇸🇦 Arabic, 🇮🇳 Hindi, 🇮🇩 Indonesian, 🇵🇱 Polish, 🇹🇷 Turkish, 🇺🇦 Ukrainian, 🇻🇳 Vietnamese, 🇹🇭 Thai, 🇳🇱 Dutch

## 🔍 Fuzzy Search Examples

Find countries even with typos:
- `"germny"` → finds `"Germany"`
- `"japn"` → finds `"Japan"`
- `"united sttes"` → finds `"United States"`

## 📚 API Reference

#### Builder Methods

| Method | Description |
|--------|-------------|
| `.selectedCountry(Country?)` | Set selected country |
| `.onCountrySelected(Function)` | Set selection callback |
| `.labelText(String?)` | Set custom label |
| `.hintText(String?)` | Set custom hint |
| `.showPhoneCodes(bool)` | Show/hide phone codes |
| `.backgroundColor(Color?)` | Set background color |
| `.headerColor(Color?)` | Set header color |
| `.textColor(Color?)` | Set text color |
| `.accentColor(Color?)` | Set accent color |
| `.searchFieldColor(Color?)` | Set search field color |
| `.searchFieldBorderColor(Color?)` | Set search field border |
| `.cursorColor(Color?)` | Set cursor color |
| `.hintTextColor(Color?)` | Set hint text color |
| `.hoverColor(Color?)` | Set hover color |
| `.borderRadius(double?)` | Set border radius |
| `.textStyle(TextStyle?)` | Set text style |
| `.itemHeight(double?)` | Set item height |
| `.itemPadding(EdgeInsets?)` | Set item padding |
| `.flagSize(double?)` | Set flag size |
| `.showFlags(bool)` | Show/hide flags |
| `.showCountryCodes(bool)` | Show/hide country codes |
| `.adaptiveHeight(bool)` | Enable/disable adaptive height |

### 🔧 Traditional API

### CountryPicker Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `selectedCountry` | `Country?` | `null` | Currently selected country |
| `onCountrySelected` | `Function(Country)` | Required | Selection callback |
| `labelText` | `String?` | `null` | Custom label text |
| `hintText` | `String?` | `null` | Custom hint text |
| `showPhoneCodes` | `bool` | `true` | Show phone codes |
| `backgroundColor` | `Color?` | Dark theme | Modal background |
| `headerColor` | `Color?` | Dark theme | Header background |
| `textColor` | `Color?` | Dark theme | Text color |
| `accentColor` | `Color?` | Green | Accent color |
| `searchFieldColor` | `Color?` | Dark theme | Search field background |
| `searchFieldBorderColor` | `Color?` | Dark theme | Search field border |
| `cursorColor` | `Color?` | White | Text cursor color |
| `hintTextColor` | `Color?` | Dark theme | Hint text color |
| `hoverColor` | `Color?` | Dark theme | Hover color |
| `borderRadius` | `double?` | `8.0` | Border radius |
| `textStyle` | `TextStyle?` | `14px` | Custom text style |
| `itemHeight` | `double?` | `56.0` | Item height |
| `itemPadding` | `EdgeInsets?` | `12x8` | Item padding (horizontal: 12, vertical: 8) |
| `flagSize` | `double?` | `20.0` | Flag size |
| `showFlags` | `bool` | `true` | Show flags |
| `showCountryCodes` | `bool` | `true` | Show country codes |
| `adaptiveHeight` | `bool` | `false` | Enable adaptive height |

### Country Object

```dart
class Country {
  final String code;      // "US", "DE", "RU"
  final String flag;      // "🇺🇸", "🇩🇪", "🇷🇺"
  final String phoneCode; // "+1", "+49", "+7"
  
  String getDisplayName(BuildContext context); // Get localized name
}
```

## 🚀 Performance Tips

### Remove Unused Languages
To reduce package size, remove language files you don't need:

```bash
rm lib/src/flutter_country_picker/localizations/country_localizations_es.dart
```

Then update the localization files accordingly.




## 📄 License

MIT License - see [LICENSE](LICENSE) for details.

## 👨‍💻 Author

**Stanislav Bozhko**  
Email: stas.bozhko@gmail.com  
GitHub: [@stanislavworldin](https://github.com/stanislavworldin)

## ☕ Support

If this package helps you, consider buying me a coffee! ☕

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/stanislavbozhko)

---

**⭐ Star this repository if you find it useful!** 