import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:country_search/country_search.dart';
import 'package:country_search/country_search.dart' as country_search_package;

const String PACKAGE_VERSION = '2.8.1';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _currentLocale = const Locale('en');
  bool _isDarkTheme = true;

  void _changeLanguage(Locale locale) {
    setState(() {
      _currentLocale = locale;
    });
    debugPrint('Language changed to: ${locale.languageCode}');
  }

  void _toggleTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
    debugPrint('Theme changed to: ${_isDarkTheme ? 'dark' : 'light'}');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country Picker Demo v$PACKAGE_VERSION',
      theme: _isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      locale: _currentLocale,
      localizationsDelegates: const [
        CountryLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: CountryLocalizations.supportedLocales,
      home: MyHomePage(
        onLanguageChanged: _changeLanguage,
        onThemeChanged: _toggleTheme,
        currentLocale: _currentLocale,
        isDarkTheme: _isDarkTheme,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Function(Locale) onLanguageChanged;
  final VoidCallback onThemeChanged;
  final Locale currentLocale;
  final bool isDarkTheme;

  const MyHomePage({
    super.key,
    required this.onLanguageChanged,
    required this.onThemeChanged,
    required this.currentLocale,
    required this.isDarkTheme,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Country? selectedCountry;

  String _getLanguageName(String code) {
    switch (code) {
      case 'ar':
        return '🇸🇦 العربية';
      case 'de':
        return '🇩🇪 Deutsch';
      case 'en':
        return '🇺🇸 English';
      case 'es':
        return '🇪🇸 Español';
      case 'fr':
        return '🇫🇷 Français';
      case 'hi':
        return '🇮🇳 हिन्दी';
      case 'id':
        return '🇮🇩 Bahasa Indonesia';
      case 'it':
        return '🇮🇹 Italiano';
      case 'ja':
        return '🇯🇵 日本語';
      case 'ko':
        return '🇰🇷 한국어';
      case 'nl':
        return '🇳🇱 Nederlands';
      case 'pl':
        return '🇵🇱 Polski';
      case 'pt':
        return '🇵🇹 Português';
      case 'ru':
        return '🇷🇺 Русский';
      case 'th':
        return '🇹🇭 ไทย';
      case 'tr':
        return '🇹🇷 Türkçe';
      case 'uk':
        return '🇺🇦 Українська';
      case 'vi':
        return '🇻🇳 Tiếng Việt';
      case 'zh':
        return '🇨🇳 中文';
      default:
        return '🇺🇸 English';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country Picker Demo v$PACKAGE_VERSION'),
        actions: [
          // Theme toggle button
          IconButton(
            icon: Icon(widget.isDarkTheme ? Icons.light_mode : Icons.dark_mode),
            onPressed: widget.onThemeChanged,
          ),
          PopupMenuButton<Locale>(
            onSelected: widget.onLanguageChanged,
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(
                value: Locale('ar'),
                child: Text('🇸🇦 العربية'),
              ),
              const PopupMenuItem(
                value: Locale('de'),
                child: Text('🇩🇪 Deutsch'),
              ),
              const PopupMenuItem(
                value: Locale('en'),
                child: Text('🇺🇸 English'),
              ),
              const PopupMenuItem(
                value: Locale('es'),
                child: Text('🇪🇸 Español'),
              ),
              const PopupMenuItem(
                value: Locale('fr'),
                child: Text('🇫🇷 Français'),
              ),
              const PopupMenuItem(
                value: Locale('hi'),
                child: Text('🇮🇳 हिन्दी'),
              ),
              const PopupMenuItem(
                value: Locale('id'),
                child: Text('🇮🇩 Bahasa Indonesia'),
              ),
              const PopupMenuItem(
                value: Locale('it'),
                child: Text('🇮🇹 Italiano'),
              ),
              const PopupMenuItem(
                value: Locale('ja'),
                child: Text('🇯🇵 日本語'),
              ),
              const PopupMenuItem(
                value: Locale('ko'),
                child: Text('🇰🇷 한국어'),
              ),
              const PopupMenuItem(
                value: Locale('nl'),
                child: Text('🇳🇱 Nederlands'),
              ),
              const PopupMenuItem(
                value: Locale('pl'),
                child: Text('🇵🇱 Polski'),
              ),
              const PopupMenuItem(
                value: Locale('pt'),
                child: Text('🇵🇹 Português'),
              ),
              const PopupMenuItem(
                value: Locale('ru'),
                child: Text('🇷🇺 Русский'),
              ),
              const PopupMenuItem(
                value: Locale('th'),
                child: Text('🇹🇭 ไทย'),
              ),
              const PopupMenuItem(
                value: Locale('tr'),
                child: Text('🇹🇷 Türkçe'),
              ),
              const PopupMenuItem(
                value: Locale('uk'),
                child: Text('🇺🇦 Українська'),
              ),
              const PopupMenuItem(
                value: Locale('vi'),
                child: Text('🇻🇳 Tiếng Việt'),
              ),
              const PopupMenuItem(
                value: Locale('zh'),
                child: Text('🇨🇳 中文'),
              ),
            ],
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.language),
                  const SizedBox(width: 4),
                  Text(_getLanguageName(widget.currentLocale.languageCode)),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Language indicator
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.blue.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.blue.withValues(alpha: 0.3)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.language, size: 16, color: Colors.blue),
                    const SizedBox(width: 4),
                    Text(
                      'Current Language: ${_getLanguageName(widget.currentLocale.languageCode)}',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Country picker section
              const Text(
                'Select your country:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              CountryPicker(
                selectedCountry: selectedCountry,
                onCountrySelected: (Country country) {
                  setState(() {
                    selectedCountry = country;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Selected: ${country.flag} ${country.code} (${country.phoneCode})'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),

              // Light theme picker
              const Text(
                'Light Theme Version:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              CountryPicker(
                selectedCountry: selectedCountry,
                onCountrySelected: (Country country) {
                  setState(() {
                    selectedCountry = country;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Selected: ${country.flag} ${country.code} (${country.phoneCode})'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                backgroundColor: Colors.white,
                headerColor: Colors.grey.shade100,
                textColor: Colors.black87,
                accentColor: Colors.blue,
                searchFieldColor: Colors.grey.shade50,
                searchFieldBorderColor: Colors.grey.shade300,
                cursorColor: Colors.blue,
                hintTextColor: Colors.grey.shade600,
                hoverColor: Colors.grey.shade200, // Light theme hover color
                borderRadius: 12.0, // Custom border radius
              ),
              const SizedBox(height: 16),

              // Custom theme picker
              const Text(
                'Custom Theme (Purple):',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              CountryPicker(
                selectedCountry: selectedCountry,
                onCountrySelected: (Country country) {
                  setState(() {
                    selectedCountry = country;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Selected: ${country.flag} ${country.code} (${country.phoneCode})'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                // Purple theme colors
                backgroundColor: Colors.purple.shade50,
                headerColor: Colors.purple.shade100,
                textColor: Colors.purple.shade900,
                accentColor: Colors.purple,
                searchFieldColor: Colors.purple.shade50,
                searchFieldBorderColor: Colors.purple.shade200,
                cursorColor: Colors.purple,
                hintTextColor: Colors.purple.shade600,
                hoverColor: Colors.purple.shade200,
                borderRadius: 16.0,
                // Advanced customization demo
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.purple,
                ),
                itemHeight: 72.0, // Larger items for better touch targets
                itemPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                flagSize: 28.0, // Bigger flags
                showFlags: true,
                showCountryCodes: true,
              ),
              const SizedBox(height: 16),

              // Minimal theme picker
              const Text(
                'Minimal Theme:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              CountryPicker(
                selectedCountry: selectedCountry,
                onCountrySelected: (Country country) {
                  setState(() {
                    selectedCountry = country;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Selected: ${country.flag} ${country.code} (${country.phoneCode})'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                // Minimal theme
                backgroundColor: Colors.grey.shade50,
                headerColor: Colors.grey.shade100,
                textColor: Colors.grey.shade800,
                accentColor: Colors.grey.shade600,
                searchFieldColor: Colors.white,
                searchFieldBorderColor: Colors.grey.shade300,
                cursorColor: Colors.grey.shade600,
                hintTextColor: Colors.grey.shade500,
                hoverColor: Colors.grey.shade100,
                borderRadius: 4.0,
                // Minimal customization
                textStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
                itemHeight: 44.0, // Compact items
                itemPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                flagSize: 16.0, // Smaller flags
                showFlags: true,
                showCountryCodes: false, // Hide country codes for minimal look
              ),
              const SizedBox(height: 32),

              // Builder API Examples
              const Text(
                'Builder API Examples:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Builder API - Dark Theme
              const Text(
                'Builder API - Dark Theme:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              CountryPicker.builder()
                  .selectedCountry(selectedCountry)
                  .onCountrySelected((Country country) {
                    setState(() {
                      selectedCountry = country;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Selected: ${country.flag} ${country.code} (${country.phoneCode})'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  })
                  .darkTheme()
                  .build(),
              const SizedBox(height: 16),

              // Builder API - Light Theme
              const Text(
                'Builder API - Light Theme:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              CountryPicker.builder()
                  .selectedCountry(selectedCountry)
                  .onCountrySelected((Country country) {
                    setState(() {
                      selectedCountry = country;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Selected: ${country.flag} ${country.code} (${country.phoneCode})'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  })
                  .lightTheme()
                  .build(),
              const SizedBox(height: 16),

              // Builder API - Purple Theme
              const Text(
                'Builder API - Purple Theme:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              CountryPicker.builder()
                  .selectedCountry(selectedCountry)
                  .onCountrySelected((Country country) {
                    setState(() {
                      selectedCountry = country;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Selected: ${country.flag} ${country.code} (${country.phoneCode})'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  })
                  .purpleTheme()
                  .itemHeight(72.0)
                  .flagSize(28.0)
                  .textStyle(const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ))
                  .build(),
              const SizedBox(height: 16),

              // Builder API - Minimal Theme
              const Text(
                'Builder API - Minimal Theme:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              CountryPicker.builder()
                  .selectedCountry(selectedCountry)
                  .onCountrySelected((Country country) {
                    setState(() {
                      selectedCountry = country;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Selected: ${country.flag} ${country.code} (${country.phoneCode})'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  })
                  .minimalTheme()
                  .showCountryCodes(false)
                  .build(),
              const SizedBox(height: 32),

              // Selected country display
              if (selectedCountry != null) ...[
                const Text(
                  'Selected Country:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha((0.1 * 255).toInt()),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: Row(
                    children: [
                      Text(
                        selectedCountry!.flag,
                        style: const TextStyle(fontSize: 32),
                      ),
                      const SizedBox(width: 16),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              selectedCountry!.code,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              CountryLocalizations.of(context)
                                  .getCountryName(selectedCountry!.code),
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                            Text(
                              'Phone: ${selectedCountry!.phoneCode}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 24),

              // Example with disabled suggested countries
              const Text(
                'Without Suggested Countries:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              CountryPicker(
                selectedCountry: selectedCountry,
                onCountrySelected: (Country country) {
                  setState(() {
                    selectedCountry = country;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Selected: ${country.flag} ${country.code} (${country.phoneCode})'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                backgroundColor: Colors.orange.shade50,
                headerColor: Colors.orange.shade100,
                textColor: Colors.orange.shade900,
                accentColor: Colors.orange,
                searchFieldColor: Colors.orange.shade50,
                searchFieldBorderColor: Colors.orange.shade200,
                cursorColor: Colors.orange,
                hintTextColor: Colors.orange.shade600,
                hoverColor: Colors.orange.shade200,
                borderRadius: 12.0,
                showSuggestedCountries: false, // Disable suggested countries
              ),
              const SizedBox(height: 24),

              // Features section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha((0.05 * 255).toInt()),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white12),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Features:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('• 252+ countries with flags'),
                    Text('• Phone codes included'),
                    Text('• Multi-language support (19 languages)'),
                    Text('• Smart search functionality'),
                    Text('• Suggested countries based on app locale'),
                    Text('• Builder API for easy customization'),
                    Text('• Pre-built themes (Dark, Light, Purple, Minimal)'),
                    Text('• Beautiful dark theme'),
                    Text('• Light theme support'),
                    Text('• Advanced customization options'),
                    Text('• Customizable text styles'),
                    Text('• Adjustable item heights'),
                    Text('• Flexible padding control'),
                    Text('• Customizable flag sizes'),
                    Text('• Show/hide elements'),
                    Text('• Responsive design'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
