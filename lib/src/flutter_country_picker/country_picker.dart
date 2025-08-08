import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'country_data.dart';
import 'country_language_mapping.dart';
import 'localizations/country_localizations.dart';

/// Builder API for creating CountryPicker with a fluent interface
class CountryPickerBuilder {
  Country? _selectedCountry;
  Function(Country)? _onCountrySelected;
  String? _labelText;
  String? _hintText;
  bool _showPhoneCodes = true;

  // UI Customization
  Color? _backgroundColor;
  Color? _headerColor;
  Color? _textColor;
  Color? _accentColor;
  Color? _searchFieldColor;
  Color? _searchFieldBorderColor;
  Color? _cursorColor;
  Color? _hintTextColor;
  Color? _hoverColor;
  double? _borderRadius;

  // Advanced Customization
  TextStyle? _textStyle;
  double? _itemHeight;
  EdgeInsets? _itemPadding;
  double? _flagSize;
  bool _showFlags = true;
  bool _showCountryCodes = true;
  bool _adaptiveHeight = false;
  bool _showSuggestedCountries = true;

  /// Set the selected country
  CountryPickerBuilder selectedCountry(Country? country) {
    _selectedCountry = country;
    return this;
  }

  /// Set the callback for country selection
  CountryPickerBuilder onCountrySelected(Function(Country) callback) {
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

  /// Set the background color
  CountryPickerBuilder backgroundColor(Color? color) {
    _backgroundColor = color;
    return this;
  }

  /// Set the header color
  CountryPickerBuilder headerColor(Color? color) {
    _headerColor = color;
    return this;
  }

  /// Set the text color
  CountryPickerBuilder textColor(Color? color) {
    _textColor = color;
    return this;
  }

  /// Set the accent color
  CountryPickerBuilder accentColor(Color? color) {
    _accentColor = color;
    return this;
  }

  /// Set the search field color
  CountryPickerBuilder searchFieldColor(Color? color) {
    _searchFieldColor = color;
    return this;
  }

  /// Set the search field border color
  CountryPickerBuilder searchFieldBorderColor(Color? color) {
    _searchFieldBorderColor = color;
    return this;
  }

  /// Set the cursor color
  CountryPickerBuilder cursorColor(Color? color) {
    _cursorColor = color;
    return this;
  }

  /// Set the hint text color
  CountryPickerBuilder hintTextColor(Color? color) {
    _hintTextColor = color;
    return this;
  }

  /// Set the hover color
  CountryPickerBuilder hoverColor(Color? color) {
    _hoverColor = color;
    return this;
  }

  /// Set the border radius
  CountryPickerBuilder borderRadius(double? radius) {
    _borderRadius = radius;
    return this;
  }

  /// Set the text style
  CountryPickerBuilder textStyle(TextStyle? style) {
    _textStyle = style;
    return this;
  }

  /// Set the item height
  CountryPickerBuilder itemHeight(double? height) {
    _itemHeight = height;
    return this;
  }

  /// Set the item padding
  CountryPickerBuilder itemPadding(EdgeInsets? padding) {
    _itemPadding = padding;
    return this;
  }

  /// Set the flag size
  CountryPickerBuilder flagSize(double? size) {
    _flagSize = size;
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

  /// Set a custom theme (dark theme by default)
  CountryPickerBuilder darkTheme() {
    _backgroundColor = const Color(0xFF302E2C);
    _headerColor = const Color(0xFF3C3A38);
    _textColor = Colors.white;
    _accentColor = const Color(0xFF699B4B);
    _searchFieldColor = const Color(0x0D000000);
    _searchFieldBorderColor = Colors.white24;
    _cursorColor = Colors.white;
    _hintTextColor = Colors.white54;
    _hoverColor = Colors.white10;
    return this;
  }

  /// Set a custom theme (light theme)
  CountryPickerBuilder lightTheme() {
    _backgroundColor = Colors.white;
    _headerColor = const Color(0xFFF5F5F5);
    _textColor = Colors.black87;
    _accentColor = Colors.blue;
    _searchFieldColor = const Color(0xFFF0F0F0);
    _searchFieldBorderColor = Colors.grey.shade300;
    _cursorColor = Colors.blue;
    _hintTextColor = Colors.grey.shade600;
    _hoverColor = Colors.grey.shade100;
    return this;
  }

  /// Set a purple theme
  CountryPickerBuilder purpleTheme() {
    _backgroundColor = const Color(0xFF2D1B69);
    _headerColor = const Color(0xFF3C2B7A);
    _textColor = Colors.white;
    _accentColor = const Color(0xFF9C27B0);
    _searchFieldColor = const Color(0x1AFFFFFF);
    _searchFieldBorderColor = Colors.purple.shade300;
    _cursorColor = Colors.purple.shade300;
    _hintTextColor = Colors.purple.shade200;
    _hoverColor = Colors.purple.shade800;
    return this;
  }

  /// Set a minimal theme (compact design)
  CountryPickerBuilder minimalTheme() {
    _itemHeight = 40.0;
    _itemPadding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4);
    _flagSize = 16.0;
    _textStyle = const TextStyle(fontSize: 12);
    _borderRadius = 4.0;
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
      backgroundColor: _backgroundColor,
      headerColor: _headerColor,
      textColor: _textColor,
      accentColor: _accentColor,
      searchFieldColor: _searchFieldColor,
      searchFieldBorderColor: _searchFieldBorderColor,
      cursorColor: _cursorColor,
      hintTextColor: _hintTextColor,
      hoverColor: _hoverColor,
      borderRadius: _borderRadius,
      textStyle: _textStyle,
      itemHeight: _itemHeight,
      itemPadding: _itemPadding,
      flagSize: _flagSize,
      showFlags: _showFlags,
      showCountryCodes: _showCountryCodes,
      adaptiveHeight: _adaptiveHeight,
      showSuggestedCountries: _showSuggestedCountries,
    );
  }
}

class CountryPicker extends StatefulWidget {
  final Country? selectedCountry;
  final Function(Country) onCountrySelected;
  final String? labelText;
  final String? hintText;
  final bool showPhoneCodes;

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

  const CountryPicker({
    super.key,
    this.selectedCountry,
    required this.onCountrySelected,
    this.labelText,
    this.hintText,
    this.showPhoneCodes = true,
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
  List<Country> _allCountries = [];
  List<Country> _filteredCountries = [];
  List<Country> _baseCountries = []; // Base countries without suggestions
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

  // Getter methods for colors with fallback
  Color get backgroundColor =>
      widget.backgroundColor ?? _defaultBackgroundColor;
  Color get headerColor => widget.headerColor ?? _defaultHeaderColor;
  Color get textColor => widget.textColor ?? _defaultTextColor;
  Color get accentColor => widget.accentColor ?? _defaultAccentColor;
  Color get searchFieldColor =>
      widget.searchFieldColor ?? _defaultSearchFieldColor;
  Color get searchFieldBorderColor =>
      widget.searchFieldBorderColor ?? _defaultSearchFieldBorderColor;
  Color get cursorColor => widget.cursorColor ?? _defaultCursorColor;
  Color get hintTextColor => widget.hintTextColor ?? _defaultHintTextColor;
  Color get hoverColor => widget.hoverColor ?? _defaultHoverColor;
  double get borderRadius => widget.borderRadius ?? _defaultBorderRadius;

  // Advanced customization getters
  TextStyle get textStyle => widget.textStyle ?? const TextStyle(fontSize: 14);
  double? get itemHeight => widget.itemHeight;
  EdgeInsets get itemPadding => widget.itemPadding ?? _defaultItemPadding;
  double get flagSize => widget.flagSize ?? 20.0;
  bool get showFlags => widget.showFlags;
  bool get showCountryCodes => widget.showCountryCodes;

  @override
  void initState() {
    super.initState();
    // Initialize with basic sorted countries (without suggestions)
    _baseCountries = CountryData.countries;
    _allCountries = CountryData.countries;
    _filteredCountries = _allCountries;
    if (kDebugMode) {
      debugPrint('DEBUG: Initialized with basic countries');
      debugPrint(
        'DEBUG: First 5 countries in initState: ${_allCountries.take(5).map((c) => c.code).join(', ')}',
      );
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateCountriesForLanguage();
  }

  void _updateCountriesForLanguage() {
    try {
      // Use basic countries list, suggestions will be sorted by population
      _allCountries = _organizeCountriesWithSuggestions(CountryData.countries);
      _filteredCountries = _allCountries;
      if (kDebugMode) {
        debugPrint('DEBUG: Updated countries for language with suggestions');
        debugPrint(
          'DEBUG: First 5 countries: ${_allCountries.take(5).map((c) => c.code).join(', ')}',
        );
      }
      // Trigger UI update after sorting
      setState(() {
        _updateCounter++;
      });
    } catch (e) {
      if (kDebugMode) {
        debugPrint('DEBUG: Failed to update countries for language: $e');
      }
      _allCountries = _organizeCountriesWithSuggestions(CountryData.countries);
      _filteredCountries = _allCountries;
      // Trigger UI update after sorting
      setState(() {
        _updateCounter++;
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // Removed controller listener; onChanged in TextField handles updates inside the modal

  // Calculate Levenshtein distance for fuzzy search
  int _levenshteinDistance(String s1, String s2) {
    if (s1.isEmpty) return s2.length;
    if (s2.isEmpty) return s1.length;

    List<List<int>> matrix = List.generate(
      s1.length + 1,
      (i) => List.generate(s2.length + 1, (j) => 0),
    );

    for (int i = 0; i <= s1.length; i++) {
      matrix[i][0] = i;
    }
    for (int j = 0; j <= s2.length; j++) {
      matrix[0][j] = j;
    }

    for (int i = 1; i <= s1.length; i++) {
      for (int j = 1; j <= s2.length; j++) {
        int cost = s1[i - 1] == s2[j - 1] ? 0 : 1;
        matrix[i][j] = [
          matrix[i - 1][j] + 1, // deletion
          matrix[i][j - 1] + 1, // insertion
          matrix[i - 1][j - 1] + cost, // substitution
        ].reduce((a, b) => a < b ? a : b);
      }
    }

    return matrix[s1.length][s2.length];
  }

  // Check fuzzy match with distance threshold
  bool _isFuzzyMatch(String query, String text, {int maxDistance = 3}) {
    if (query.length <= 2) {
      return false; // Skip fuzzy search for very short queries
    }

    final distance = _levenshteinDistance(query, text);
    final maxAllowedDistance = (query.length / 3).ceil(); // Adaptive threshold
    final threshold =
        maxDistance < maxAllowedDistance ? maxDistance : maxAllowedDistance;

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
    final results = <Country>[];
    final exactMatches = <Country>[];
    final startsWithMatches = <Country>[];
    final containsMatches = <Country>[];
    final fuzzyMatches = <Country>[];

    // Normalize query for phone code search
    final normalizedQuery = query.toLowerCase().trim();
    final queryForPhoneCode =
        normalizedQuery.startsWith('+') ? normalizedQuery : '+$normalizedQuery';

    // Use base countries list for search (without suggestions organization)
    for (final country in _baseCountries) {
      final countryName =
          countryLocalizations.getCountryName(country.code).toLowerCase();
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

    results.addAll(exactMatches);
    results.addAll(startsWithMatches);
    results.addAll(containsMatches);
    results.addAll(fuzzyMatches);

    // Sort search results by priority: exact matches first, then alphabetically within each group
    results.sort((a, b) {
      // Get priority for each country
      int getPriority(Country country) {
        if (exactMatches.contains(country)) return 0;
        if (startsWithMatches.contains(country)) return 1;
        if (containsMatches.contains(country)) return 2;
        if (fuzzyMatches.contains(country)) return 3;
        return 4;
      }

      final priorityA = getPriority(a);
      final priorityB = getPriority(b);

      // First sort by priority
      if (priorityA != priorityB) {
        return priorityA.compareTo(priorityB);
      }

      // Then sort alphabetically within the same priority group
      final nameA = countryLocalizations.getCountryName(a.code).toLowerCase();
      final nameB = countryLocalizations.getCountryName(b.code).toLowerCase();
      return nameA.compareTo(nameB);
    });

    // For search results, show all results without suggestions organization
    _filteredCountries = results;
  }

  /// Organize countries with suggested countries at the top
  List<Country> _organizeCountriesWithSuggestions(List<Country> countries) {
    if (!widget.showSuggestedCountries) {
      return countries;
    }

    final suggestedCountries = CountryLanguageMapping.getSuggestedCountries(
      CountryLanguageMapping.getCurrentLanguageCode(context),
    );

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
      if (!suggestedCountries.contains(country.code)) {
        regular.add(country);
      }
    }

    if (kDebugMode) {
      debugPrint(
        'DEBUG: Suggested countries: ${suggested.length}, Regular: ${regular.length}',
      );
      debugPrint(
        'DEBUG: First 5 suggested: ${suggested.take(5).map((c) => c.code).join(', ')}',
      );
    }

    // Return suggested countries first, then regular countries
    return [...suggested, ...regular];
  }

  /// Get organized countries with suggested countries separated
  Map<String, List<Country>> _getOrganizedCountries() {
    if (!widget.showSuggestedCountries) {
      return {'all': _filteredCountries};
    }

    // If searching (query is not empty), show only search results without suggestions
    if (_isSearching) {
      if (kDebugMode) {
        debugPrint(
          'DEBUG: Searching - showing only search results without suggestions',
        );
      }
      return {'all': _filteredCountries};
    }

    // If not searching (empty query), show suggestions + all countries
    final suggestedCountries = CountryLanguageMapping.getSuggestedCountries(
      CountryLanguageMapping.getCurrentLanguageCode(context),
    );

    final suggested = <Country>[];
    final regular = <Country>[];

    // For empty search, we want to show suggestions + all countries (with possible duplicates)
    // First, add suggested countries
    for (final country in _filteredCountries) {
      if (suggestedCountries.contains(country.code)) {
        suggested.add(country);
      }
    }

    // Then add all countries (including those that might be in suggestions) and sort by name
    regular.addAll(_filteredCountries);

    // Sort regular countries alphabetically by name
    final countryLocalizations = CountryLocalizations.of(context);
    regular.sort((a, b) {
      final nameA = countryLocalizations.getCountryName(a.code).toLowerCase();
      final nameB = countryLocalizations.getCountryName(b.code).toLowerCase();
      return nameA.compareTo(nameB);
    });

    if (kDebugMode) {
      debugPrint(
        'DEBUG: Empty search - showing suggestions (${suggested.length}) + all countries (${regular.length})',
      );
    }

    return {'suggested': suggested, 'regular': regular};
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
    ScrollController scrollController,
    CountryLocalizations countryLocalizations,
  ) {
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
    final suggested = organizedCountries['suggested']!;
    final regular = organizedCountries['regular']!;
    final hasSuggested = suggested.isNotEmpty;
    final hasRegular = regular.isNotEmpty;

    final items = <Widget>[];

    // Add suggested countries
    for (final country in suggested) {
      items.add(_buildCountryItem(country, countryLocalizations));
    }

    // Add divider if both sections have items
    if (hasSuggested && hasRegular) {
      items.add(_buildSuggestedDivider());
    }

    // Add regular countries
    for (final country in regular) {
      items.add(_buildCountryItem(country, countryLocalizations));
    }

    if (kDebugMode) {
      debugPrint(
        'DEBUG: Building list with ${suggested.length} suggested + ${regular.length} regular countries',
      );
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
                  Container(
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
                        Text(
                          countryLocalizations.selectCountry,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          decoration: BoxDecoration(
                            color: searchFieldColor,
                            borderRadius: BorderRadius.circular(borderRadius),
                            border: Border.all(
                              color: searchFieldBorderColor,
                              width: 0.5,
                            ),
                          ),
                          child: TextField(
                            controller: _searchController,
                            style: TextStyle(color: textColor, fontSize: 14),
                            autofocus: true,
                            textInputAction: TextInputAction.search,
                            cursorColor: cursorColor,
                            onChanged: (value) {
                              final query = value.toLowerCase().trim();
                              _filterAndSortCountries(query);
                              setModalState(() {
                                _isSearching = query.isNotEmpty;
                                _updateCounter++;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: countryLocalizations.searchCountry,
                              hintStyle: TextStyle(
                                color: hintTextColor,
                                fontSize: 14,
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: hintTextColor,
                                size: 20,
                              ),
                              suffixIcon: _isSearching
                                  ? IconButton(
                                      icon: Icon(
                                        Icons.clear,
                                        color: hintTextColor,
                                        size: 18,
                                      ),
                                      onPressed: () {
                                        _searchController.clear();
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
                  ),
                  Expanded(
                    child: _buildCountryList(
                      scrollController,
                      countryLocalizations,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
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
                              style:
                                  TextStyle(color: hintTextColor, fontSize: 11),
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
