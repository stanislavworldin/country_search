import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'country_data.dart';
import 'country_language_mapping.dart';
import 'localizations/country_localizations.dart';

/// Presentation style for country picker modal
enum CountryPickerModalPresentation { bottomSheet, dialog }

typedef CountryFilter = bool Function(Country country);

/// Theme configuration for [CountryPicker].
@immutable
class CountryPickerThemeData {
  final Color? backgroundColor;
  final Color? headerColor;
  final Color? textColor;
  final Color? accentColor;
  final Color? searchFieldColor;
  final Color? searchFieldBorderColor;
  final Color? cursorColor;
  final Color? hintTextColor;
  final Color? hoverColor;
  final double? borderRadius;
  final TextStyle? textStyle;
  final double? itemHeight;
  final EdgeInsets? itemPadding;
  final double? flagSize;

  const CountryPickerThemeData({
    this.backgroundColor,
    this.headerColor,
    this.textColor,
    this.accentColor,
    this.searchFieldColor,
    this.searchFieldBorderColor,
    this.cursorColor,
    this.hintTextColor,
    this.hoverColor,
    this.borderRadius,
    this.textStyle,
    this.itemHeight,
    this.itemPadding,
    this.flagSize,
  });

  static const CountryPickerThemeData dark = CountryPickerThemeData(
    backgroundColor: Color(0xFF302E2C),
    headerColor: Color(0xFF3C3A38),
    textColor: Colors.white,
    accentColor: Color(0xFF699B4B),
    searchFieldColor: Color(0x0D000000),
    searchFieldBorderColor: Colors.white24,
    cursorColor: Colors.white,
    hintTextColor: Colors.white54,
    hoverColor: Colors.white10,
    borderRadius: 8.0,
    textStyle: TextStyle(fontSize: 14),
    itemPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    flagSize: 20.0,
  );

  static const CountryPickerThemeData light = CountryPickerThemeData(
    backgroundColor: Colors.white,
    headerColor: Color(0xFFF5F5F5),
    textColor: Colors.black87,
    accentColor: Colors.blue,
    searchFieldColor: Color(0xFFF0F0F0),
    searchFieldBorderColor: Color(0xFFE0E0E0),
    cursorColor: Colors.blue,
    hintTextColor: Color(0xFF757575),
    hoverColor: Color(0xFFF5F5F5),
    borderRadius: 8.0,
    textStyle: TextStyle(fontSize: 14),
    itemPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    flagSize: 20.0,
  );

  static const CountryPickerThemeData purple = CountryPickerThemeData(
    backgroundColor: Color(0xFF2D1B69),
    headerColor: Color(0xFF3C2B7A),
    textColor: Colors.white,
    accentColor: Color(0xFF9C27B0),
    searchFieldColor: Color(0x1AFFFFFF),
    searchFieldBorderColor: Color(0xFFCE93D8),
    cursorColor: Color(0xFFCE93D8),
    hintTextColor: Color(0xFFE1BEE7),
    hoverColor: Color(0xFF4A148C),
    borderRadius: 16.0,
    textStyle: TextStyle(fontSize: 14),
    itemPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    flagSize: 20.0,
  );

  static const CountryPickerThemeData minimal = CountryPickerThemeData(
    itemHeight: 40.0,
    itemPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    flagSize: 16.0,
    textStyle: TextStyle(fontSize: 12),
    borderRadius: 4.0,
  );

  CountryPickerThemeData copyWith({
    Color? backgroundColor,
    Color? headerColor,
    Color? textColor,
    Color? accentColor,
    Color? searchFieldColor,
    Color? searchFieldBorderColor,
    Color? cursorColor,
    Color? hintTextColor,
    Color? hoverColor,
    double? borderRadius,
    TextStyle? textStyle,
    double? itemHeight,
    EdgeInsets? itemPadding,
    double? flagSize,
  }) {
    return CountryPickerThemeData(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      headerColor: headerColor ?? this.headerColor,
      textColor: textColor ?? this.textColor,
      accentColor: accentColor ?? this.accentColor,
      searchFieldColor: searchFieldColor ?? this.searchFieldColor,
      searchFieldBorderColor:
          searchFieldBorderColor ?? this.searchFieldBorderColor,
      cursorColor: cursorColor ?? this.cursorColor,
      hintTextColor: hintTextColor ?? this.hintTextColor,
      hoverColor: hoverColor ?? this.hoverColor,
      borderRadius: borderRadius ?? this.borderRadius,
      textStyle: textStyle ?? this.textStyle,
      itemHeight: itemHeight ?? this.itemHeight,
      itemPadding: itemPadding ?? this.itemPadding,
      flagSize: flagSize ?? this.flagSize,
    );
  }
}

/// Builder API for creating CountryPicker with a fluent interface
class CountryPickerBuilder {
  Country? _selectedCountry;
  ValueChanged<Country>? _onCountrySelected;
  String? _labelText;
  String? _hintText;
  bool _showPhoneCodes = true;
  List<String> _favorites = const [];
  List<String> _exclude = const [];
  CountryFilter? _countryFilter;
  VoidCallback? _onOpened;
  VoidCallback? _onClosed;
  ValueChanged<String>? _onSearchChanged;
  CountryPickerThemeData _themeData = CountryPickerThemeData.dark;

  // Advanced Customization
  bool _showFlags = true;
  bool _showCountryCodes = true;
  bool _adaptiveHeight = false;
  bool _showSuggestedCountries = true;
  CountryPickerModalPresentation _modalPresentation =
      CountryPickerModalPresentation.bottomSheet;

  /// Set the selected country
  CountryPickerBuilder selectedCountry(Country? country) {
    _selectedCountry = country;
    return this;
  }

  /// Set the callback for country selection
  CountryPickerBuilder onCountrySelected(ValueChanged<Country> callback) {
    _onCountrySelected = callback;
    return this;
  }

  /// Set the label text
  CountryPickerBuilder labelText(String? text) {
    _labelText = text;
    return this;
  }

  /// Set the hint text
  CountryPickerBuilder hintText(String? text) {
    _hintText = text;
    return this;
  }

  /// Set whether to show phone codes
  CountryPickerBuilder showPhoneCodes(bool show) {
    _showPhoneCodes = show;
    return this;
  }

  /// Set favorite country codes displayed before suggested and regular sections.
  CountryPickerBuilder favorites(List<String> favorites) {
    _favorites = List.unmodifiable(favorites);
    return this;
  }

  /// Set country codes to exclude from picker and search.
  CountryPickerBuilder exclude(List<String> exclude) {
    _exclude = List.unmodifiable(exclude);
    return this;
  }

  /// Set a custom country filter applied to all data.
  CountryPickerBuilder countryFilter(CountryFilter filter) {
    _countryFilter = filter;
    return this;
  }

  /// Called when the picker modal is opened.
  CountryPickerBuilder onOpened(VoidCallback callback) {
    _onOpened = callback;
    return this;
  }

  /// Called when the picker modal is closed.
  CountryPickerBuilder onClosed(VoidCallback callback) {
    _onClosed = callback;
    return this;
  }

  /// Called when search input changes.
  CountryPickerBuilder onSearchChanged(ValueChanged<String> callback) {
    _onSearchChanged = callback;
    return this;
  }

  /// Set the background color
  CountryPickerBuilder backgroundColor(Color? color) {
    _themeData = _themeData.copyWith(backgroundColor: color);
    return this;
  }

  /// Set the header color
  CountryPickerBuilder headerColor(Color? color) {
    _themeData = _themeData.copyWith(headerColor: color);
    return this;
  }

  /// Set the text color
  CountryPickerBuilder textColor(Color? color) {
    _themeData = _themeData.copyWith(textColor: color);
    return this;
  }

  /// Set the accent color
  CountryPickerBuilder accentColor(Color? color) {
    _themeData = _themeData.copyWith(accentColor: color);
    return this;
  }

  /// Set the search field color
  CountryPickerBuilder searchFieldColor(Color? color) {
    _themeData = _themeData.copyWith(searchFieldColor: color);
    return this;
  }

  /// Set the search field border color
  CountryPickerBuilder searchFieldBorderColor(Color? color) {
    _themeData = _themeData.copyWith(searchFieldBorderColor: color);
    return this;
  }

  /// Set the cursor color
  CountryPickerBuilder cursorColor(Color? color) {
    _themeData = _themeData.copyWith(cursorColor: color);
    return this;
  }

  /// Set the hint text color
  CountryPickerBuilder hintTextColor(Color? color) {
    _themeData = _themeData.copyWith(hintTextColor: color);
    return this;
  }

  /// Set the hover color
  CountryPickerBuilder hoverColor(Color? color) {
    _themeData = _themeData.copyWith(hoverColor: color);
    return this;
  }

  /// Set the border radius
  CountryPickerBuilder borderRadius(double? radius) {
    _themeData = _themeData.copyWith(borderRadius: radius);
    return this;
  }

  /// Set the text style
  CountryPickerBuilder textStyle(TextStyle? style) {
    _themeData = _themeData.copyWith(textStyle: style);
    return this;
  }

  /// Set the item height
  CountryPickerBuilder itemHeight(double? height) {
    _themeData = _themeData.copyWith(itemHeight: height);
    return this;
  }

  /// Set the item padding
  CountryPickerBuilder itemPadding(EdgeInsets? padding) {
    _themeData = _themeData.copyWith(itemPadding: padding);
    return this;
  }

  /// Set the flag size
  CountryPickerBuilder flagSize(double? size) {
    _themeData = _themeData.copyWith(flagSize: size);
    return this;
  }

  /// Set all visual styling via a single theme object.
  CountryPickerBuilder themeData(CountryPickerThemeData themeData) {
    _themeData = themeData;
    return this;
  }

  /// Set whether to show flags
  CountryPickerBuilder showFlags(bool show) {
    _showFlags = show;
    return this;
  }

  /// Set whether to show country codes
  CountryPickerBuilder showCountryCodes(bool show) {
    _showCountryCodes = show;
    return this;
  }

  /// Set whether to use adaptive height
  CountryPickerBuilder adaptiveHeight(bool adaptive) {
    _adaptiveHeight = adaptive;
    return this;
  }

  /// Set whether to show suggested countries based on locale
  CountryPickerBuilder showSuggestedCountries(bool show) {
    _showSuggestedCountries = show;
    return this;
  }

  /// Set how the picker is presented (bottom sheet by default)
  CountryPickerBuilder modalPresentation(
    CountryPickerModalPresentation presentation,
  ) {
    _modalPresentation = presentation;
    return this;
  }

  /// Set a custom theme (dark theme by default)
  CountryPickerBuilder darkTheme() {
    _themeData = CountryPickerThemeData.dark;
    return this;
  }

  /// Set a custom theme (light theme)
  CountryPickerBuilder lightTheme() {
    _themeData = CountryPickerThemeData.light;
    return this;
  }

  /// Set a purple theme
  CountryPickerBuilder purpleTheme() {
    _themeData = CountryPickerThemeData.purple;
    return this;
  }

  /// Set a minimal theme (compact design)
  CountryPickerBuilder minimalTheme() {
    _themeData = _themeData.copyWith(
      itemHeight: CountryPickerThemeData.minimal.itemHeight,
      itemPadding: CountryPickerThemeData.minimal.itemPadding,
      flagSize: CountryPickerThemeData.minimal.flagSize,
      textStyle: CountryPickerThemeData.minimal.textStyle,
      borderRadius: CountryPickerThemeData.minimal.borderRadius,
    );
    return this;
  }

  /// Build the CountryPicker widget
  CountryPicker build() {
    if (_onCountrySelected == null) {
      throw ArgumentError('onCountrySelected callback is required');
    }

    return CountryPicker(
      selectedCountry: _selectedCountry,
      onCountrySelected: _onCountrySelected!,
      labelText: _labelText,
      hintText: _hintText,
      showPhoneCodes: _showPhoneCodes,
      favorites: _favorites,
      exclude: _exclude,
      countryFilter: _countryFilter,
      onOpened: _onOpened,
      onClosed: _onClosed,
      onSearchChanged: _onSearchChanged,
      themeData: _themeData,
      showFlags: _showFlags,
      showCountryCodes: _showCountryCodes,
      adaptiveHeight: _adaptiveHeight,
      showSuggestedCountries: _showSuggestedCountries,
      modalPresentation: _modalPresentation,
    );
  }
}

class CountryPicker extends StatefulWidget {
  final Country? selectedCountry;
  final ValueChanged<Country> onCountrySelected;
  final String? labelText;
  final String? hintText;
  final bool showPhoneCodes;
  final List<String> favorites;
  final List<String> exclude;
  final CountryFilter? countryFilter;
  final VoidCallback? onOpened;
  final VoidCallback? onClosed;
  final ValueChanged<String>? onSearchChanged;
  final CountryPickerThemeData? themeData;

  // UI Customization
  final Color? backgroundColor;
  final Color? headerColor;
  final Color? textColor;
  final Color? accentColor;
  final Color? searchFieldColor;
  final Color? searchFieldBorderColor;
  final Color? cursorColor;
  final Color? hintTextColor;
  final Color? hoverColor;
  final double? borderRadius;

  // Advanced Customization
  final TextStyle? textStyle;
  final double? itemHeight;
  final EdgeInsets? itemPadding;
  final double? flagSize;
  final bool showFlags;
  final bool showCountryCodes;
  final bool adaptiveHeight;
  final bool showSuggestedCountries;
  final CountryPickerModalPresentation modalPresentation;

  const CountryPicker({
    super.key,
    this.selectedCountry,
    required this.onCountrySelected,
    this.labelText,
    this.hintText,
    this.showPhoneCodes = true,
    this.favorites = const [],
    this.exclude = const [],
    this.countryFilter,
    this.onOpened,
    this.onClosed,
    this.onSearchChanged,
    this.themeData,
    this.backgroundColor,
    this.headerColor,
    this.textColor,
    this.accentColor,
    this.searchFieldColor,
    this.searchFieldBorderColor,
    this.cursorColor,
    this.hintTextColor,
    this.hoverColor,
    this.borderRadius,
    this.textStyle,
    this.itemHeight,
    this.itemPadding,
    this.flagSize,
    this.showFlags = true,
    this.showCountryCodes = true,
    this.adaptiveHeight = false,
    this.showSuggestedCountries = true,
    this.modalPresentation = CountryPickerModalPresentation.bottomSheet,
  })  : assert(
          itemHeight == null || itemHeight > 0,
          'itemHeight must be positive',
        ),
        assert(flagSize == null || flagSize > 0, 'flagSize must be positive'),
        assert(
          borderRadius == null || borderRadius >= 0,
          'borderRadius must be non-negative',
        );

  /// Create a builder for fluent API
  static CountryPickerBuilder builder() {
    return CountryPickerBuilder();
  }

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  final TextEditingController _searchController = TextEditingController();
  List<Country> _sourceCountries = [];
  List<Country> _allCountries = [];
  List<Country> _filteredCountries = [];
  List<Country> _baseCountries = []; // Base countries without suggestions
  List<Country> _favoriteCountriesForDisplay = [];
  List<Country> _suggestedCountriesForDisplay = [];
  List<Country> _regularCountriesForDisplay = [];
  bool _isSearching = false;
  int _updateCounter = 0;

  // Constants for performance optimization
  static const TextStyle _defaultSelectedPhoneCodeTextStyle = TextStyle(
    fontSize: 9,
    fontWeight: FontWeight.w500,
    color: Colors.blue,
  );

  static const EdgeInsets _defaultItemPadding = EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 8,
  );
  static const EdgeInsets _buttonPadding = EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 10,
  );
  static const EdgeInsets _itemMargin = EdgeInsets.symmetric(
    horizontal: 8,
    vertical: 1,
  );

  static const SizedBox _spacer12 = SizedBox(width: 12);
  static const SizedBox _spacer10 = SizedBox(width: 10);
  static const SizedBox _spacer2 = SizedBox(height: 2);

  // Default colors for dark theme
  static const Color _defaultBackgroundColor = Color(
    0xFF302E2C,
  ); // Original dark theme
  static const Color _defaultHeaderColor = Color(
    0xFF3C3A38,
  ); // Original dark theme
  static const Color _defaultTextColor = Colors.white;
  static const Color _defaultAccentColor = Color(
    0xFF699B4B,
  ); // Original green accent
  static const Color _defaultSearchFieldColor = Color(
    0x0D000000,
  ); // Original 5% white
  static const Color _defaultSearchFieldBorderColor = Colors.white24;
  static const Color _defaultCursorColor = Colors.white;
  static const Color _defaultHintTextColor = Colors.white54;
  static const Color _defaultHoverColor = Colors.white10;
  static const double _defaultBorderRadius = 8.0;

  CountryPickerThemeData get _themeData =>
      widget.themeData ?? CountryPickerThemeData.dark;

  // Getter methods for colors with fallback
  Color get backgroundColor =>
      widget.backgroundColor ??
      _themeData.backgroundColor ??
      _defaultBackgroundColor;
  Color get headerColor =>
      widget.headerColor ?? _themeData.headerColor ?? _defaultHeaderColor;
  Color get textColor =>
      widget.textColor ?? _themeData.textColor ?? _defaultTextColor;
  Color get accentColor =>
      widget.accentColor ?? _themeData.accentColor ?? _defaultAccentColor;
  Color get searchFieldColor =>
      widget.searchFieldColor ??
      _themeData.searchFieldColor ??
      _defaultSearchFieldColor;
  Color get searchFieldBorderColor =>
      widget.searchFieldBorderColor ??
      _themeData.searchFieldBorderColor ??
      _defaultSearchFieldBorderColor;
  Color get cursorColor =>
      widget.cursorColor ?? _themeData.cursorColor ?? _defaultCursorColor;
  Color get hintTextColor =>
      widget.hintTextColor ?? _themeData.hintTextColor ?? _defaultHintTextColor;
  Color get hoverColor =>
      widget.hoverColor ?? _themeData.hoverColor ?? _defaultHoverColor;
  double get borderRadius =>
      widget.borderRadius ?? _themeData.borderRadius ?? _defaultBorderRadius;

  // Advanced customization getters
  TextStyle get textStyle =>
      widget.textStyle ?? _themeData.textStyle ?? const TextStyle(fontSize: 14);
  double? get itemHeight => widget.itemHeight ?? _themeData.itemHeight;
  EdgeInsets get itemPadding =>
      widget.itemPadding ?? _themeData.itemPadding ?? _defaultItemPadding;
  double get flagSize => widget.flagSize ?? _themeData.flagSize ?? 20.0;
  bool get showFlags => widget.showFlags;
  bool get showCountryCodes => widget.showCountryCodes;

  // Suggested country codes for current locale
  List<String> _getSuggestedCodes() {
    return CountryLanguageMapping.getSuggestedCountries(
      CountryLanguageMapping.getCurrentLanguageCode(context),
    );
  }

  @override
  void initState() {
    super.initState();
    _sourceCountries = _buildSourceCountries();
    _baseCountries = _sourceCountries;
    _allCountries = _sourceCountries;
    _filteredCountries = _sourceCountries;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateCountriesForLanguage();
  }

  @override
  void didUpdateWidget(covariant CountryPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    final hasDataConfigChanged =
        oldWidget.showSuggestedCountries != widget.showSuggestedCountries ||
            !listEquals(oldWidget.favorites, widget.favorites) ||
            !listEquals(oldWidget.exclude, widget.exclude) ||
            oldWidget.countryFilter != widget.countryFilter;
    if (hasDataConfigChanged) {
      _updateCountriesForLanguage();
    }
  }

  void _updateCountriesForLanguage() {
    final countryLocalizations = CountryLocalizations.of(context);
    _sourceCountries = _buildSourceCountries();
    _baseCountries = _sourceCountries;

    // Use basic countries list; organize depending on suggestion setting.
    if (widget.showSuggestedCountries) {
      _allCountries = _organizeCountriesWithSuggestions(_sourceCountries);
    } else {
      _allCountries = _sortCountriesAlphabetically(
        _sourceCountries,
        countryLocalizations,
      );
    }
    _filteredCountries = _allCountries;
    _rebuildDisplayCaches(countryLocalizations);

    // Trigger UI update after sorting.
    setState(() {
      _updateCounter++;
    });
  }

  List<Country> _buildSourceCountries() {
    final excludedCodes = widget.exclude
        .map((code) => code.trim().toUpperCase())
        .where((code) => code.isNotEmpty)
        .toSet();
    final predicate = widget.countryFilter;

    return [
      for (final country in CountryData.countries)
        if (!excludedCodes.contains(country.code) &&
            (predicate == null || predicate(country)))
          country,
    ];
  }

  List<Country> _buildPriorityCountries(List<String> countryCodes) {
    if (countryCodes.isEmpty) {
      return const [];
    }

    final sourceByCode = <String, Country>{
      for (final country in _sourceCountries) country.code: country,
    };
    final seen = <String>{};
    final prioritized = <Country>[];

    for (final rawCode in countryCodes) {
      final code = rawCode.trim().toUpperCase();
      if (code.isEmpty || !seen.add(code)) {
        continue;
      }
      final country = sourceByCode[code];
      if (country != null) {
        prioritized.add(country);
      }
    }

    return prioritized;
  }

  void _rebuildDisplayCaches(CountryLocalizations countryLocalizations) {
    _favoriteCountriesForDisplay = _buildPriorityCountries(widget.favorites);
    final favoriteCodes =
        _favoriteCountriesForDisplay.map((country) => country.code).toSet();

    if (!widget.showSuggestedCountries) {
      _suggestedCountriesForDisplay = const [];
      _regularCountriesForDisplay = _sortCountriesAlphabetically(
        _sourceCountries
            .where((country) => !favoriteCodes.contains(country.code))
            .toList(),
        countryLocalizations,
      );
      return;
    }

    final suggestedCodes = _getSuggestedCodes();
    final countryByCode = <String, Country>{
      for (final country in _sourceCountries) country.code: country,
    };

    _suggestedCountriesForDisplay = [
      for (final code in suggestedCodes)
        if (countryByCode[code] case final country?)
          if (!favoriteCodes.contains(country.code)) country,
    ];
    final suggestedCodeSet =
        _suggestedCountriesForDisplay.map((country) => country.code).toSet();

    _regularCountriesForDisplay = _sortCountriesAlphabetically(
      _sourceCountries
          .where(
            (country) =>
                !favoriteCodes.contains(country.code) &&
                !suggestedCodeSet.contains(country.code),
          )
          .toList(),
      countryLocalizations,
    );
  }

  /// Sort countries alphabetically by localized name
  List<Country> _sortCountriesAlphabetically(
    List<Country> countries,
    CountryLocalizations countryLocalizations,
  ) {
    final sorted = [...countries];
    sorted.sort((a, b) {
      final nameA = countryLocalizations.getCountryName(a.code).toLowerCase();
      final nameB = countryLocalizations.getCountryName(b.code).toLowerCase();
      return nameA.compareTo(nameB);
    });
    return sorted;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // Removed controller listener; onChanged in TextField handles updates inside the modal

  // Calculate Levenshtein distance for fuzzy search
  int _levenshteinDistance(String s1, String s2, {int? maxDistance}) {
    if (s1 == s2) {
      return 0;
    }
    if (s1.isEmpty) {
      return s2.length;
    }
    if (s2.isEmpty) {
      return s1.length;
    }

    var longer = s1;
    var shorter = s2;
    if (shorter.length > longer.length) {
      final temp = longer;
      longer = shorter;
      shorter = temp;
    }

    if (maxDistance != null &&
        (longer.length - shorter.length).abs() > maxDistance) {
      return maxDistance + 1;
    }

    final source = longer.codeUnits;
    final target = shorter.codeUnits;

    final previousRow = List<int>.generate(target.length + 1, (i) => i);
    final currentRow = List<int>.filled(target.length + 1, 0);

    for (var i = 1; i <= source.length; i++) {
      currentRow[0] = i;
      var rowMin = currentRow[0];

      for (var j = 1; j <= target.length; j++) {
        final cost = source[i - 1] == target[j - 1] ? 0 : 1;
        final deletion = previousRow[j] + 1;
        final insertion = currentRow[j - 1] + 1;
        final substitution = previousRow[j - 1] + cost;
        final value = math.min(math.min(deletion, insertion), substitution);
        currentRow[j] = value;
        if (value < rowMin) {
          rowMin = value;
        }
      }

      if (maxDistance != null && rowMin > maxDistance) {
        return maxDistance + 1;
      }

      for (var j = 0; j <= target.length; j++) {
        previousRow[j] = currentRow[j];
      }
    }

    return previousRow[target.length];
  }

  // Check fuzzy match with distance threshold
  bool _isFuzzyMatch(String query, String text, {int maxDistance = 3}) {
    if (query.length <= 2) {
      return false; // Skip fuzzy search for very short queries
    }

    final maxAllowedDistance = (query.length / 3).ceil(); // Adaptive threshold
    final threshold = math.min(maxDistance, maxAllowedDistance);
    if ((query.length - text.length).abs() > threshold) {
      return false;
    }

    final distance = _levenshteinDistance(
      query,
      text,
      maxDistance: threshold,
    );

    return distance <= threshold;
  }

  void _filterAndSortCountries(String query) {
    if (query.isEmpty) {
      // When search is empty, show organized countries with suggestions
      _filteredCountries = _allCountries;
      if (kDebugMode) {
        debugPrint(
          'DEBUG: Empty search - showing all countries with suggestions',
        );
      }
      return;
    }

    // When searching, use base countries list (without suggestions organization)
    final countryLocalizations = CountryLocalizations.of(context);
    final exactMatches = <Country>[];
    final startsWithMatches = <Country>[];
    final containsMatches = <Country>[];
    final fuzzyMatches = <Country>[];
    final localizedNameByCode = <String, String>{};

    String getLowerLocalizedName(Country country) =>
        localizedNameByCode.putIfAbsent(
          country.code,
          () => countryLocalizations.getCountryName(country.code).toLowerCase(),
        );

    // Normalize query for phone code search
    final normalizedQuery = query.toLowerCase().trim();
    final queryForPhoneCode =
        normalizedQuery.startsWith('+') ? normalizedQuery : '+$normalizedQuery';

    // Use base countries list for search (without suggestions organization)
    for (final country in _baseCountries) {
      final countryName = getLowerLocalizedName(country);
      final countryCode = country.code.toLowerCase();
      final countryPhoneCode = country.phoneCode.toLowerCase();

      bool found = false;

      // 1. Exact matches (including phone code with and without +)
      if (countryName == normalizedQuery ||
          countryCode == normalizedQuery ||
          countryPhoneCode == normalizedQuery ||
          countryPhoneCode == queryForPhoneCode ||
          (normalizedQuery.startsWith('+') &&
              countryPhoneCode == normalizedQuery) ||
          (!normalizedQuery.startsWith('+') &&
              countryPhoneCode == '+$normalizedQuery')) {
        exactMatches.add(country);
        found = true;
      }

      // 2. Starts with query
      if (!found &&
          (countryName.startsWith(normalizedQuery) ||
              countryCode.startsWith(normalizedQuery) ||
              countryPhoneCode.startsWith(normalizedQuery) ||
              countryPhoneCode.startsWith(queryForPhoneCode))) {
        startsWithMatches.add(country);
        found = true;
      }

      // 3. Contains query
      if (!found &&
          (countryName.contains(normalizedQuery) ||
              countryCode.contains(normalizedQuery) ||
              countryPhoneCode.contains(normalizedQuery) ||
              countryPhoneCode.contains(queryForPhoneCode))) {
        containsMatches.add(country);
        found = true;
      }

      // 4. Fuzzy search for typos and misspellings
      if (!found &&
          (_isFuzzyMatch(normalizedQuery, countryName) ||
              _isFuzzyMatch(normalizedQuery, countryCode) ||
              _isFuzzyMatch(normalizedQuery, countryPhoneCode))) {
        fuzzyMatches.add(country);
      }
    }

    int compareByLocalizedName(Country a, Country b) =>
        getLowerLocalizedName(a).compareTo(getLowerLocalizedName(b));

    exactMatches.sort(compareByLocalizedName);
    startsWithMatches.sort(compareByLocalizedName);
    containsMatches.sort(compareByLocalizedName);
    fuzzyMatches.sort(compareByLocalizedName);

    // For search results, preserve group priority and alphabetical order inside each group.
    _filteredCountries = [
      ...exactMatches,
      ...startsWithMatches,
      ...containsMatches,
      ...fuzzyMatches,
    ];
  }

  /// Organize countries with suggested countries at the top
  List<Country> _organizeCountriesWithSuggestions(List<Country> countries) {
    if (!widget.showSuggestedCountries) {
      return countries;
    }

    final suggestedCountries = _getSuggestedCodes();
    final suggestedSet = suggestedCountries.toSet();

    // Create a map for quick lookup
    final countryMap = <String, Country>{};
    for (final country in countries) {
      countryMap[country.code] = country;
    }

    final suggested = <Country>[];
    final regular = <Country>[];

    // Add suggested countries in the order they come from CountryLanguageMapping
    for (final countryCode in suggestedCountries) {
      final country = countryMap[countryCode];
      if (country != null) {
        suggested.add(country);
      }
    }

    // Add regular countries
    for (final country in countries) {
      if (!suggestedSet.contains(country.code)) {
        regular.add(country);
      }
    }

    // Return suggested countries first, then regular countries
    return [...suggested, ...regular];
  }

  /// Get organized countries with suggested countries separated
  Map<String, List<Country>> _getOrganizedCountries() {
    if (!widget.showSuggestedCountries) {
      if (_isSearching) {
        return {'all': _filteredCountries};
      }

      return {
        if (_favoriteCountriesForDisplay.isNotEmpty)
          'favorites': _favoriteCountriesForDisplay,
        'regular': _regularCountriesForDisplay,
      };
    }

    // If searching (query is not empty), show only search results without suggestions
    if (_isSearching) {
      return {'all': _filteredCountries};
    }

    // Not searching: use precomputed sections.
    return {
      if (_favoriteCountriesForDisplay.isNotEmpty)
        'favorites': _favoriteCountriesForDisplay,
      'suggested': _suggestedCountriesForDisplay,
      'regular': _regularCountriesForDisplay,
    };
  }

  /// Build the modal header with drag handle, title and search field
  Widget _buildModalHeader(
    StateSetter setModalState,
    CountryLocalizations countryLocalizations,
  ) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      decoration: BoxDecoration(
        color: headerColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(borderRadius * 2),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 32,
            height: 3,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(1.5),
            ),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(Icons.close, color: hintTextColor, size: 20),
              splashRadius: 20,
              onPressed: () => Navigator.of(context).pop(),
              tooltip: MaterialLocalizations.of(context).closeButtonLabel,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: searchFieldColor,
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(color: searchFieldBorderColor, width: 0.5),
            ),
            child: TextField(
              controller: _searchController,
              style: TextStyle(color: textColor, fontSize: 14),
              autofocus: true,
              textInputAction: TextInputAction.search,
              cursorColor: cursorColor,
              onChanged: (value) {
                final query = value.toLowerCase().trim();
                widget.onSearchChanged?.call(value);
                _filterAndSortCountries(query);
                setModalState(() {
                  _isSearching = query.isNotEmpty;
                  _updateCounter++;
                });
              },
              decoration: InputDecoration(
                hintText: countryLocalizations.searchCountry,
                hintStyle: TextStyle(color: hintTextColor, fontSize: 14),
                prefixIcon: Icon(Icons.search, color: hintTextColor, size: 20),
                suffixIcon: _isSearching
                    ? IconButton(
                        icon: Icon(Icons.clear, color: hintTextColor, size: 18),
                        onPressed: () {
                          _searchController.clear();
                          widget.onSearchChanged?.call('');
                          setModalState(() {
                            _isSearching = false;
                            _updateCounter++;
                            _filteredCountries = _allCountries;
                          });
                        },
                      )
                    : null,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
                isDense: false,
                alignLabelWithHint: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Create a divider widget for suggested countries section
  Widget _buildSuggestedDivider() {
    if (!widget.showSuggestedCountries) return const SizedBox.shrink();

    final countryLocalizations = CountryLocalizations.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 1,
              color: hintTextColor.withValues(alpha: 0.3),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              countryLocalizations.allCountries,
              style: TextStyle(
                color: hintTextColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 1,
              color: hintTextColor.withValues(alpha: 0.3),
            ),
          ),
        ],
      ),
    );
  }

  /// Build the country list with suggested countries support
  Widget _buildCountryList(
    CountryLocalizations countryLocalizations, {
    ScrollController? scrollController,
  }) {
    final organizedCountries = _getOrganizedCountries();

    if (organizedCountries.containsKey('all')) {
      // No suggested countries or searching - use simple list
      return ListView.builder(
        key: ValueKey(
          'country_list_${_filteredCountries.length}_$_updateCounter',
        ),
        controller: scrollController,
        itemCount: _filteredCountries.length,
        itemBuilder: (context, index) =>
            _buildCountryItem(_filteredCountries[index], countryLocalizations),
      );
    }

    // Build list with suggested countries and divider
    final favorites = organizedCountries['favorites'] ?? const <Country>[];
    final suggested = organizedCountries['suggested'] ?? const <Country>[];
    final regular = organizedCountries['regular'] ?? const <Country>[];
    final hasFavorites = favorites.isNotEmpty;
    final hasSuggested = suggested.isNotEmpty;
    final hasRegular = regular.isNotEmpty;

    final items = <Widget>[];

    // Add favorite countries first.
    for (final country in favorites) {
      items.add(_buildCountryItem(country, countryLocalizations));
    }

    // Add suggested countries
    for (final country in suggested) {
      items.add(_buildCountryItem(country, countryLocalizations));
    }

    // Add divider if there are items before regular section.
    if ((hasFavorites || hasSuggested) && hasRegular) {
      items.add(_buildSuggestedDivider());
    }

    // Add regular countries
    for (final country in regular) {
      items.add(_buildCountryItem(country, countryLocalizations));
    }

    return ListView.builder(
      key: ValueKey('country_list_organized_${items.length}_$_updateCounter'),
      controller: scrollController,
      itemCount: items.length,
      itemBuilder: (context, index) => items[index],
    );
  }

  /// Build individual country item
  Widget _buildCountryItem(
    Country country,
    CountryLocalizations countryLocalizations,
  ) {
    final isSelected = widget.selectedCountry?.code == country.code;
    final countryName = countryLocalizations.getCountryName(country.code);

    return RepaintBoundary(
      child: Container(
        margin: _itemMargin,
        height: widget.adaptiveHeight ? null : (itemHeight ?? 56.0),
        decoration: BoxDecoration(
          color: isSelected
              ? accentColor.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(borderRadius),
            hoverColor: hoverColor,
            onTap: () {
              widget.onCountrySelected(country);
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: itemPadding,
              child: Row(
                children: [
                  if (showFlags)
                    Text(country.flag, style: TextStyle(fontSize: flagSize)),
                  _spacer12,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          countryName,
                          style: textStyle.copyWith(
                            color: isSelected ? accentColor : textColor,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.normal,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (showCountryCodes) ...[
                          _spacer2,
                          Text(
                            widget.showPhoneCodes
                                ? '${country.code} (${country.phoneCode})'
                                : country.code,
                            style: textStyle.copyWith(
                              color: isSelected
                                  ? accentColor.withValues(alpha: 0.7)
                                  : hintTextColor,
                              fontSize: 12,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (isSelected)
                    Icon(Icons.check_circle, color: accentColor, size: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showCountryPicker() {
    final countryLocalizations = CountryLocalizations.of(context);
    widget.onOpened?.call();

    if (widget.modalPresentation ==
        CountryPickerModalPresentation.bottomSheet) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(borderRadius * 2),
          ),
        ),
        builder: (context) => StatefulBuilder(
          builder: (context, setModalState) {
            return DraggableScrollableSheet(
              initialChildSize: 0.7,
              minChildSize: 0.5,
              maxChildSize: 0.9,
              expand: false,
              builder: (context, scrollController) => RepaintBoundary(
                child: Column(
                  children: [
                    _buildModalHeader(setModalState, countryLocalizations),
                    Expanded(
                      child: _buildCountryList(
                        countryLocalizations,
                        scrollController: scrollController,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ).whenComplete(() => widget.onClosed?.call());
      return;
    }

    // Centered dialog presentation
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            final mediaQuery = MediaQuery.of(context);
            final maxHeight = mediaQuery.size.height * 0.75;
            final maxWidth = mediaQuery.size.width * 0.9;
            final dialogWidth = maxWidth.clamp(280.0, 560.0);
            return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 24,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: maxHeight,
                  maxWidth: dialogWidth,
                ),
                child: Material(
                  color: backgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius * 2),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(borderRadius * 2),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildModalHeader(setModalState, countryLocalizations),
                        Expanded(
                          child: _buildCountryList(
                            countryLocalizations,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    ).whenComplete(() => widget.onClosed?.call());
  }

  @override
  Widget build(BuildContext context) {
    final countryLocalizations = CountryLocalizations.of(context);

    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.labelText != null) ...[
            Text(
              widget.labelText!,
              style: TextStyle(
                color: hintTextColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
          ],
          Material(
            color: Colors.transparent,
            child: InkWell(
              key: ValueKey('country_picker_$_updateCounter'),
              onTap: _showCountryPicker,
              borderRadius: BorderRadius.circular(borderRadius),
              child: Container(
                padding: _buttonPadding,
                constraints: const BoxConstraints(
                  minHeight: 48,
                ), // Minimum height to prevent overflow
                decoration: BoxDecoration(
                  border: Border.all(color: searchFieldBorderColor, width: 0.5),
                  borderRadius: BorderRadius.circular(borderRadius),
                  color: searchFieldColor,
                ),
                child: Row(
                  children: [
                    if (widget.selectedCountry != null) ...[
                      Text(
                        widget.selectedCountry!.flag,
                        style: const TextStyle(fontSize: 18),
                      ),
                      _spacer10,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize:
                              MainAxisSize.min, // Fix Column layout issue
                          children: [
                            Text(
                              CountryLocalizations.getCountryNameSafe(
                                context,
                                widget.selectedCountry!.code,
                              ),
                              style: TextStyle(
                                color: textColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow:
                                  TextOverflow.ellipsis, // Handle text overflow
                            ),
                            _spacer2,
                            Text(
                              widget.selectedCountry!.code,
                              style: TextStyle(
                                color: hintTextColor,
                                fontSize: 11,
                              ),
                              overflow:
                                  TextOverflow.ellipsis, // Handle text overflow
                            ),
                            if (widget.showPhoneCodes) ...[
                              _spacer2,
                              Text(
                                widget.selectedCountry!.phoneCode,
                                style: _defaultSelectedPhoneCodeTextStyle,
                                overflow: TextOverflow
                                    .ellipsis, // Handle text overflow
                              ),
                            ],
                          ],
                        ),
                      ),
                    ] else ...[
                      Icon(Icons.flag, color: hintTextColor, size: 18),
                      _spacer10,
                      Expanded(
                        child: Text(
                          widget.hintText ??
                              countryLocalizations.selectYourCountry,
                          style: TextStyle(color: hintTextColor, fontSize: 14),
                        ),
                      ),
                    ],
                    Icon(Icons.arrow_drop_down, color: hintTextColor, size: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
