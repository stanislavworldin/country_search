import 'package:country_search/country_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

const String packageVersion = '3.0.1';

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
  }

  void _toggleTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country Picker Demo',
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: _isDarkTheme ? ThemeMode.dark : ThemeMode.light,
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
  final ValueChanged<Locale> onLanguageChanged;
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

enum DemoThemePreset { dark, light, purple, minimal }

class _LocaleOption {
  final Locale locale;
  final String label;

  const _LocaleOption(this.locale, this.label);
}

const List<_LocaleOption> _localeOptions = [
  _LocaleOption(Locale('ar'), 'Arabic (ar)'),
  _LocaleOption(Locale('bn'), 'Bengali (bn)'),
  _LocaleOption(Locale('de'), 'German (de)'),
  _LocaleOption(Locale('en'), 'English (en)'),
  _LocaleOption(Locale('es'), 'Spanish (es)'),
  _LocaleOption(Locale('fr'), 'French (fr)'),
  _LocaleOption(Locale('hi'), 'Hindi (hi)'),
  _LocaleOption(Locale('id'), 'Indonesian (id)'),
  _LocaleOption(Locale('it'), 'Italian (it)'),
  _LocaleOption(Locale('ja'), 'Japanese (ja)'),
  _LocaleOption(Locale('ko'), 'Korean (ko)'),
  _LocaleOption(Locale('nl'), 'Dutch (nl)'),
  _LocaleOption(Locale('pl'), 'Polish (pl)'),
  _LocaleOption(Locale('pt'), 'Portuguese (pt)'),
  _LocaleOption(Locale('ru'), 'Russian (ru)'),
  _LocaleOption(Locale('th'), 'Thai (th)'),
  _LocaleOption(Locale('tr'), 'Turkish (tr)'),
  _LocaleOption(Locale('uk'), 'Ukrainian (uk)'),
  _LocaleOption(Locale('ur'), 'Urdu (ur)'),
  _LocaleOption(Locale('vi'), 'Vietnamese (vi)'),
  _LocaleOption(Locale('zh'), 'Chinese (zh)'),
];

class _MyHomePageState extends State<MyHomePage> {
  Country? _selectedCountry;

  DemoThemePreset _themePreset = DemoThemePreset.dark;
  CountryPickerModalPresentation _presentation =
      CountryPickerModalPresentation.bottomSheet;

  bool _showPhoneCodes = true;
  bool _showFlags = true;
  bool _showCountryCodes = true;
  bool _showSuggestedCountries = true;
  bool _useRootNavigator = false;
  bool _moveAlongWithKeyboard = true;

  bool _favoritesEnabled = true;
  bool _excludeEnabled = false;
  bool _filterEnabled = false;

  bool _customItemBuilderEnabled = false;
  bool _customHeaderEnabled = false;
  bool _customEmptyBuilderEnabled = true;
  bool _useSvgFlags = false;
  bool _limitBottomSheetWidth = false;

  double _bottomSheetWidth = 560;

  final List<String> _events = <String>[];

  void _logEvent(String message) {
    final now = DateTime.now();
    final timestamp =
        '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';
    setState(() {
      _events.insert(0, '[$timestamp] $message');
      if (_events.length > 8) {
        _events.removeRange(8, _events.length);
      }
    });
  }

  CountryPickerThemeData _resolveThemeData() {
    switch (_themePreset) {
      case DemoThemePreset.dark:
        return CountryPickerThemeData.dark;
      case DemoThemePreset.light:
        return CountryPickerThemeData.light;
      case DemoThemePreset.purple:
        return CountryPickerThemeData.purple;
      case DemoThemePreset.minimal:
        final base = widget.isDarkTheme
            ? CountryPickerThemeData.dark
            : CountryPickerThemeData.light;
        return base.copyWith(
          itemHeight: CountryPickerThemeData.minimal.itemHeight,
          itemPadding: CountryPickerThemeData.minimal.itemPadding,
          flagSize: CountryPickerThemeData.minimal.flagSize,
          textStyle: CountryPickerThemeData.minimal.textStyle,
          borderRadius: CountryPickerThemeData.minimal.borderRadius,
        );
    }
  }

  String _themeLabel(DemoThemePreset value) {
    switch (value) {
      case DemoThemePreset.dark:
        return 'Dark';
      case DemoThemePreset.light:
        return 'Light';
      case DemoThemePreset.purple:
        return 'Purple';
      case DemoThemePreset.minimal:
        return 'Minimal';
    }
  }

  CountryPicker _buildPicker() {
    var builder = CountryPicker.builder()
        .selectedCountry(_selectedCountry)
        .onCountrySelected((country) {
          setState(() {
            _selectedCountry = country;
          });
          _logEvent('Selected ${country.code} (${country.phoneCode})');
        })
        .labelText('Select your country:')
        .hintText('Tap to choose')
        .showPhoneCodes(_showPhoneCodes)
        .showFlags(_showFlags)
        .showCountryCodes(_showCountryCodes)
        .showSuggestedCountries(_showSuggestedCountries)
        .useRootNavigator(_useRootNavigator)
        .moveAlongWithKeyboard(_moveAlongWithKeyboard)
        .bottomSheetWidth(
          _presentation == CountryPickerModalPresentation.bottomSheet &&
                  _limitBottomSheetWidth
              ? _bottomSheetWidth
              : null,
        )
        .modalPresentation(_presentation)
        .themeData(_resolveThemeData())
        .onOpened(() => _logEvent('Picker opened'))
        .onClosed(() => _logEvent('Picker closed'))
        .onSearchChanged((query) => _logEvent('Search "$query"'));

    if (_favoritesEnabled) {
      builder = builder.favorites(const ['US', 'GB', 'JP']);
    }
    if (_excludeEnabled) {
      builder = builder.exclude(const ['RU']);
    }
    if (_filterEnabled) {
      builder = builder.countryFilter((country) => country.code != 'KP');
    }
    if (_customEmptyBuilderEnabled) {
      builder = builder.emptySearchBuilder((context, query) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text('No matches for "$query". Try code or phone prefix.'),
          ),
        );
      });
    }
    if (_customHeaderEnabled) {
      builder = builder.modalHeaderBuilder((context, defaultHeader) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
              child: const Text(
                'Custom header is enabled',
                textAlign: TextAlign.center,
              ),
            ),
            defaultHeader,
          ],
        );
      });
    }
    if (_customItemBuilderEnabled) {
      builder = builder.itemBuilder(
        (context, country, isSelected, onSelect, defaultItem) {
          return InkWell(
            onTap: onSelect,
            child: Container(
              color: isSelected
                  ? Theme.of(context)
                      .colorScheme
                      .primary
                      .withValues(alpha: 0.12)
                  : null,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  if (_showFlags) Text(country.flag),
                  if (_showFlags) const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      country.getDisplayName(context),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (_showCountryCodes)
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        country.code,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  if (_showPhoneCodes)
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        country.phoneCode,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      );
    }

    return builder.build();
  }

  @override
  Widget build(BuildContext context) {
    final flagMode = _useSvgFlags ? CountryFlagMode.svg : CountryFlagMode.emoji;
    final selectedCode = _selectedCountry?.code ?? 'US';
    final selectedPhone = _selectedCountry?.phoneCode ?? '+1';
    final selectedName = _selectedCountry?.getDisplayName(context) ??
        CountryLocalizations.of(context).getCountryName('US');

    return Scaffold(
      appBar: AppBar(
        title: Text('Country Picker Demo v$packageVersion'),
        actions: [
          IconButton(
            tooltip: widget.isDarkTheme
                ? 'Switch to light mode'
                : 'Switch to dark mode',
            onPressed: widget.onThemeChanged,
            icon: Icon(widget.isDarkTheme ? Icons.light_mode : Icons.dark_mode),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton<Locale>(
              value: widget.currentLocale,
              onChanged: (locale) {
                if (locale != null) {
                  widget.onLanguageChanged(locale);
                }
              },
              items: _localeOptions
                  .map(
                    (item) => DropdownMenuItem<Locale>(
                      value: item.locale,
                      child: Text(item.label),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Interactive Playground',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            const Text(
              'Toggle options below to see how the picker and CountryFlag widgets behave in real time.',
            ),
            const SizedBox(height: 16),
            _SectionCard(
              title: 'Select your country:',
              child: _buildPicker(),
            ),
            const SizedBox(height: 16),
            _SectionCard(
              title: 'Current Selection',
              child: Row(
                children: [
                  CountryFlag.fromCountryCode(
                    selectedCode,
                    mode: flagMode,
                    style: const CountryFlagStyle(
                      size: 36,
                      isCircle: true,
                      borderColor: Colors.white24,
                      borderWidth: 1,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      '$selectedName ($selectedCode) $selectedPhone',
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _SectionCard(
              title: 'Builder API Examples:',
              child: SelectableText(
                '''
CountryPicker.builder()
  .themeData(CountryPickerThemeData.light)
  .favorites(const ['US', 'GB'])
  .exclude(const ['RU'])
  .showPhoneCodes(true)
  .modalPresentation(CountryPickerModalPresentation.dialog)
  .build();
''',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontFamily: 'monospace',
                    ),
              ),
            ),
            const SizedBox(height: 16),
            _SectionCard(
              title: 'CountryFlag Showcase',
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  _FlagDemoTile(
                    title: 'From selected country',
                    flag: CountryFlag.fromCountryCode(
                      selectedCode,
                      mode: flagMode,
                      style: const CountryFlagStyle(size: 34),
                    ),
                    subtitle: selectedCode,
                  ),
                  _FlagDemoTile(
                    title: 'From language code',
                    flag: CountryFlag.fromLanguageCode(
                      'pt-BR',
                      mode: flagMode,
                      style: const CountryFlagStyle(size: 34),
                    ),
                    subtitle: 'pt-BR',
                  ),
                  _FlagDemoTile(
                    title: 'From currency code',
                    flag: CountryFlag.fromCurrencyCode(
                      'USD',
                      mode: flagMode,
                      style: const CountryFlagStyle(size: 34),
                    ),
                    subtitle: 'USD',
                  ),
                  _FlagDemoTile(
                    title: 'From phone code',
                    flag: CountryFlag.fromPhoneCode(
                      '+81',
                      mode: flagMode,
                      style: const CountryFlagStyle(size: 34),
                    ),
                    subtitle: '+81',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _SectionCard(
              title: 'Configuration',
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<DemoThemePreset>(
                          initialValue: _themePreset,
                          decoration:
                              const InputDecoration(labelText: 'Theme preset'),
                          items: DemoThemePreset.values
                              .map(
                                (value) => DropdownMenuItem<DemoThemePreset>(
                                  value: value,
                                  child: Text(_themeLabel(value)),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            if (value == null) {
                              return;
                            }
                            setState(() {
                              _themePreset = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: DropdownButtonFormField<
                            CountryPickerModalPresentation>(
                          initialValue: _presentation,
                          decoration:
                              const InputDecoration(labelText: 'Presentation'),
                          items: const [
                            DropdownMenuItem(
                              value: CountryPickerModalPresentation.bottomSheet,
                              child: Text('Bottom sheet'),
                            ),
                            DropdownMenuItem(
                              value: CountryPickerModalPresentation.dialog,
                              child: Text('Dialog'),
                            ),
                          ],
                          onChanged: (value) {
                            if (value == null) {
                              return;
                            }
                            setState(() {
                              _presentation = value;
                              if (_presentation ==
                                  CountryPickerModalPresentation.dialog) {
                                _limitBottomSheetWidth = false;
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          value: _showSuggestedCountries,
                          title: const Text('Suggested countries'),
                          onChanged: (value) {
                            setState(() {
                              _showSuggestedCountries = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          value: _showPhoneCodes,
                          title: const Text('Phone codes'),
                          onChanged: (value) {
                            setState(() {
                              _showPhoneCodes = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          value: _showFlags,
                          title: const Text('Flags'),
                          onChanged: (value) {
                            setState(() {
                              _showFlags = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          value: _showCountryCodes,
                          title: const Text('ISO codes'),
                          onChanged: (value) {
                            setState(() {
                              _showCountryCodes = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          value: _favoritesEnabled,
                          title: const Text('Favorites block'),
                          onChanged: (value) {
                            setState(() {
                              _favoritesEnabled = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          value: _excludeEnabled,
                          title: const Text('Exclude RU'),
                          onChanged: (value) {
                            setState(() {
                              _excludeEnabled = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          value: _filterEnabled,
                          title: const Text('Filter out KP'),
                          onChanged: (value) {
                            setState(() {
                              _filterEnabled = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          value: _moveAlongWithKeyboard,
                          title: const Text('Move with keyboard'),
                          onChanged: (value) {
                            setState(() {
                              _moveAlongWithKeyboard = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          value: _useRootNavigator,
                          title: const Text('Use root navigator'),
                          onChanged: (value) {
                            setState(() {
                              _useRootNavigator = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          value: _useSvgFlags,
                          title: const Text('Use SVG flags'),
                          onChanged: (value) {
                            setState(() {
                              _useSvgFlags = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          value: _customItemBuilderEnabled,
                          title: const Text('Custom itemBuilder'),
                          onChanged: (value) {
                            setState(() {
                              _customItemBuilderEnabled = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          value: _customHeaderEnabled,
                          title: const Text('Custom header'),
                          onChanged: (value) {
                            setState(() {
                              _customHeaderEnabled = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    value: _customEmptyBuilderEnabled,
                    title: const Text('Custom emptySearchBuilder'),
                    onChanged: (value) {
                      setState(() {
                        _customEmptyBuilderEnabled = value;
                      });
                    },
                  ),
                  if (_presentation ==
                      CountryPickerModalPresentation.bottomSheet)
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      value: _limitBottomSheetWidth,
                      title: const Text('Constrain bottom-sheet width'),
                      subtitle: const Text(
                        'Off by default to avoid "window inside window" effect.',
                      ),
                      onChanged: (value) {
                        setState(() {
                          _limitBottomSheetWidth = value;
                        });
                      },
                    ),
                  if (_presentation ==
                          CountryPickerModalPresentation.bottomSheet &&
                      _limitBottomSheetWidth) ...[
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const SizedBox(
                          width: 140,
                          child: Text('Bottom-sheet width'),
                        ),
                        Expanded(
                          child: Slider(
                            value: _bottomSheetWidth,
                            min: 320,
                            max: 760,
                            divisions: 22,
                            label: _bottomSheetWidth.round().toString(),
                            onChanged: (value) {
                              setState(() {
                                _bottomSheetWidth = value;
                              });
                            },
                          ),
                        ),
                        Text(_bottomSheetWidth.round().toString()),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 16),
            _SectionCard(
              title: 'Hooks Log (onOpened / onClosed / onSearchChanged)',
              child: _events.isEmpty
                  ? const Text(
                      'No events yet. Open the picker and type in search.')
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _events
                          .map((event) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2),
                                child: Text(event),
                              ))
                          .toList(),
                    ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _SectionCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}

class _FlagDemoTile extends StatelessWidget {
  final String title;
  final Widget flag;
  final String subtitle;

  const _FlagDemoTile({
    required this.title,
    required this.flag,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 10),
          flag,
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
