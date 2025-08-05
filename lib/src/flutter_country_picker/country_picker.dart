import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'country_data.dart';
import 'localizations/country_localizations.dart';

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
  })  : assert(itemHeight == null || itemHeight > 0,
            'itemHeight must be positive'),
        assert(flagSize == null || flagSize > 0, 'flagSize must be positive'),
        assert(borderRadius == null || borderRadius >= 0,
            'borderRadius must be non-negative');

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  final TextEditingController _searchController = TextEditingController();
  List<Country> _allCountries = [];
  List<Country> _filteredCountries = [];
  bool _isSearching = false;
  int _updateCounter = 0;

  // Constants for performance optimization
  static const TextStyle _defaultSelectedPhoneCodeTextStyle =
      TextStyle(fontSize: 9, fontWeight: FontWeight.w500, color: Colors.blue);

  static const EdgeInsets _defaultItemPadding =
      EdgeInsets.symmetric(horizontal: 12, vertical: 8);
  static const EdgeInsets _buttonPadding =
      EdgeInsets.symmetric(horizontal: 12, vertical: 10);
  static const EdgeInsets _itemMargin =
      EdgeInsets.symmetric(horizontal: 8, vertical: 1);

  static const SizedBox _spacer12 = SizedBox(width: 12);
  static const SizedBox _spacer10 = SizedBox(width: 10);
  static const SizedBox _spacer2 = SizedBox(height: 2);

  // Default colors for dark theme
  static const Color _defaultBackgroundColor =
      Color(0xFF302E2C); // Original dark theme
  static const Color _defaultHeaderColor =
      Color(0xFF3C3A38); // Original dark theme
  static const Color _defaultTextColor = Colors.white;
  static const Color _defaultAccentColor =
      Color(0xFF699B4B); // Original green accent
  static const Color _defaultSearchFieldColor =
      Color(0x0D000000); // Original 5% white
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
  double get itemHeight => widget.itemHeight ?? 56.0;
  EdgeInsets get itemPadding => widget.itemPadding ?? _defaultItemPadding;
  double get flagSize => widget.flagSize ?? 20.0;
  bool get showFlags => widget.showFlags;
  bool get showCountryCodes => widget.showCountryCodes;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    _allCountries = CountryData.countries;
    _filteredCountries = _allCountries;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateCountriesForLanguage();
  }

  void _updateCountriesForLanguage() {
    try {
      final countryLocalizations = CountryLocalizations.of(context);
      _allCountries =
          CountryData.getSortedCountries(countryLocalizations.getCountryName);
      _filteredCountries = _allCountries;
      if (kDebugMode) {
        debugPrint('DEBUG: Updated countries for language');
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint('DEBUG: Failed to update countries for language: $e');
      }
      _allCountries = CountryData.countries;
      _filteredCountries = _allCountries;
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase().trim();
    _filterAndSortCountries(query);
    setState(() {
      _isSearching = query.isNotEmpty;
      _updateCounter++;
    });
  }

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
      _filteredCountries = _allCountries;
      return;
    }

    final countryLocalizations = CountryLocalizations.of(context);
    final results = <Country>[];
    final exactMatches = <Country>[];
    final startsWithMatches = <Country>[];
    final containsMatches = <Country>[];
    final fuzzyMatches = <Country>[];

    for (final country in _allCountries) {
      final countryName =
          countryLocalizations.getCountryName(country.code).toLowerCase();
      final countryCode = country.code.toLowerCase();
      final countryPhoneCode = country.phoneCode.toLowerCase();

      bool found = false;

      // 1. Exact matches
      if (countryName == query ||
          countryCode == query ||
          countryPhoneCode == query) {
        exactMatches.add(country);
        found = true;
      }

      // 2. Starts with query
      if (!found &&
          (countryName.startsWith(query) ||
              countryCode.startsWith(query) ||
              countryPhoneCode.startsWith(query))) {
        startsWithMatches.add(country);
        found = true;
      }

      // 3. Contains query
      if (!found &&
          (countryName.contains(query) ||
              countryCode.contains(query) ||
              countryPhoneCode.contains(query))) {
        containsMatches.add(country);
        found = true;
      }

      // 4. Fuzzy search for typos and misspellings
      if (!found &&
          (_isFuzzyMatch(query, countryName) ||
              _isFuzzyMatch(query, countryCode) ||
              _isFuzzyMatch(query, countryPhoneCode))) {
        fuzzyMatches.add(country);
      }
    }

    results.addAll(exactMatches);
    results.addAll(startsWithMatches);
    results.addAll(containsMatches);
    results.addAll(fuzzyMatches);

    _filteredCountries = results;
    if (kDebugMode) {
      debugPrint('DEBUG: Search "$query" - found ${results.length} countries');
      debugPrint(
          'DEBUG: Exact: ${exactMatches.length}, StartsWith: ${startsWithMatches.length}, Contains: ${containsMatches.length}, Fuzzy: ${fuzzyMatches.length}');
    }
  }

  void _showCountryPicker() {
    final countryLocalizations = CountryLocalizations.of(context);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(borderRadius * 2)),
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
                          top: Radius.circular(borderRadius * 2)),
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
                                color: searchFieldBorderColor, width: 0.5),
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
                              hintStyle:
                                  TextStyle(color: hintTextColor, fontSize: 14),
                              prefixIcon: Icon(Icons.search,
                                  color: hintTextColor, size: 20),
                              suffixIcon: _isSearching
                                  ? IconButton(
                                      icon: Icon(Icons.clear,
                                          color: hintTextColor, size: 18),
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
                                  horizontal: 12, vertical: 14),
                              isDense: false,
                              alignLabelWithHint: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      key: ValueKey(
                          'country_list_${_filteredCountries.length}_$_updateCounter'),
                      controller: scrollController,
                      itemCount: _filteredCountries.length,
                      itemBuilder: (context, index) {
                        final country = _filteredCountries[index];
                        final isSelected =
                            widget.selectedCountry?.code == country.code;
                        final countryName =
                            countryLocalizations.getCountryName(country.code);

                        return RepaintBoundary(
                          child: Container(
                            margin: _itemMargin,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? accentColor.withValues(alpha: 0.1)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(borderRadius),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius:
                                    BorderRadius.circular(borderRadius),
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
                                        Text(
                                          country.flag,
                                          style: TextStyle(fontSize: flagSize),
                                        ),
                                      _spacer12,
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              countryName,
                                              style: textStyle.copyWith(
                                                color: isSelected
                                                    ? accentColor
                                                    : textColor,
                                                fontWeight: isSelected
                                                    ? FontWeight.w600
                                                    : FontWeight.normal,
                                              ),
                                            ),
                                            _spacer2,
                                            if (showCountryCodes)
                                              Text(
                                                widget.showPhoneCodes
                                                    ? '${country.code} (${country.phoneCode})'
                                                    : country.code,
                                                style: textStyle.copyWith(
                                                  color: isSelected
                                                      ? accentColor.withValues(
                                                          alpha: 0.7)
                                                      : hintTextColor,
                                                  fontSize: 12,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      if (isSelected)
                                        Icon(
                                          Icons.check_circle,
                                          color: accentColor,
                                          size: 20,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          key: ValueKey('country_picker_$_updateCounter'),
          onTap: _showCountryPicker,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Container(
            padding: _buttonPadding,
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
                      children: [
                        Text(
                          CountryLocalizations.getCountryNameSafe(
                              context, widget.selectedCountry!.code),
                          style: TextStyle(
                            color: textColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        _spacer2,
                        Text(
                          widget.selectedCountry!.code,
                          style: TextStyle(
                            color: hintTextColor,
                            fontSize: 11,
                          ),
                        ),
                        if (widget.showPhoneCodes)
                          Text(
                            widget.selectedCountry!.phoneCode,
                            style: _defaultSelectedPhoneCodeTextStyle,
                          ),
                      ],
                    ),
                  ),
                ] else ...[
                  Icon(Icons.flag, color: hintTextColor, size: 18),
                  _spacer10,
                  Expanded(
                    child: Text(
                      widget.hintText ?? countryLocalizations.selectYourCountry,
                      style: TextStyle(
                        color: hintTextColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
                Icon(Icons.arrow_drop_down, color: hintTextColor, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
