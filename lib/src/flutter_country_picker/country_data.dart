import 'package:flutter/widgets.dart';
import 'localizations/country_localizations.dart';

/// Represents a country with its ISO code, flag emoji, and phone code
class Country {
  /// ISO country code (e.g., 'US', 'RU', 'GB')
  final String code;

  /// Country flag emoji (e.g., '🇺🇸', '🇷🇺', '🇬🇧')
  final String flag;

  /// Phone dialing code (e.g., '+1', '+7', '+44')
  final String phoneCode;

  /// Creates a new Country instance.
  ///
  /// [code] - The ISO 3166-1 alpha-2 country code
  /// [flag] - The country flag emoji
  /// [phoneCode] - The international phone dialing code
  const Country({
    required this.code,
    required this.flag,
    required this.phoneCode,
  });

  @override
  String toString() => '$flag $code ($phoneCode)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Country &&
          runtimeType == other.runtimeType &&
          code == other.code &&
          flag == other.flag &&
          phoneCode == other.phoneCode;

  @override
  int get hashCode => code.hashCode ^ flag.hashCode ^ phoneCode.hashCode;

  /// Get the localized display name for this country
  String getDisplayName(BuildContext context) {
    return CountryLocalizations.of(context).getCountryName(code);
  }
}

/// Utility class for managing country data and operations
class CountryData {
  /// Creates a new CountryData instance.
  ///
  /// This class provides static methods for country operations.
  /// It cannot be instantiated directly.
  const CountryData._();

  /// Complete list of all supported countries with phone codes
  static const List<Country> countries = [
    Country(code: 'AC', flag: '🇦🇨', phoneCode: '+247'),
    Country(code: 'AD', flag: '🇦🇩', phoneCode: '+376'),
    Country(code: 'AE', flag: '🇦🇪', phoneCode: '+971'),
    Country(code: 'AF', flag: '🇦🇫', phoneCode: '+93'),
    Country(code: 'AG', flag: '🇦🇬', phoneCode: '+1268'),
    Country(code: 'AI', flag: '🇦🇮', phoneCode: '+1264'),
    Country(code: 'AL', flag: '🇦🇱', phoneCode: '+355'),
    Country(code: 'AM', flag: '🇦🇲', phoneCode: '+374'),
    Country(code: 'AO', flag: '🇦🇴', phoneCode: '+244'),
    Country(code: 'AQ', flag: '🇦🇶', phoneCode: '+672'),
    Country(code: 'AR', flag: '🇦🇷', phoneCode: '+54'),
    Country(code: 'AS', flag: '🇦🇸', phoneCode: '+1684'),
    Country(code: 'AT', flag: '🇦🇹', phoneCode: '+43'),
    Country(code: 'AU', flag: '🇦🇺', phoneCode: '+61'),
    Country(code: 'AW', flag: '🇦🇼', phoneCode: '+297'),
    Country(code: 'AX', flag: '🇦🇽', phoneCode: '+358'),
    Country(code: 'AZ', flag: '🇦🇿', phoneCode: '+994'),
    Country(code: 'BA', flag: '🇧🇦', phoneCode: '+387'),
    Country(code: 'BB', flag: '🇧🇧', phoneCode: '+1246'),
    Country(code: 'BD', flag: '🇧🇩', phoneCode: '+880'),
    Country(code: 'BE', flag: '🇧🇪', phoneCode: '+32'),
    Country(code: 'BG', flag: '🇧🇬', phoneCode: '+359'),
    Country(code: 'BF', flag: '🇧🇫', phoneCode: '+226'),
    Country(code: 'BH', flag: '🇧🇭', phoneCode: '+973'),
    Country(code: 'BI', flag: '🇧🇮', phoneCode: '+257'),
    Country(code: 'BJ', flag: '🇧🇯', phoneCode: '+229'),
    Country(code: 'BL', flag: '🇧🇱', phoneCode: '+590'),
    Country(code: 'BM', flag: '🇧🇲', phoneCode: '+1441'),
    Country(code: 'BN', flag: '🇧🇳', phoneCode: '+673'),
    Country(code: 'BO', flag: '🇧🇴', phoneCode: '+591'),
    Country(code: 'BQ', flag: '🇧🇶', phoneCode: '+599'),
    Country(code: 'BR', flag: '🇧🇷', phoneCode: '+55'),
    Country(code: 'BS', flag: '🇧🇸', phoneCode: '+1242'),
    Country(code: 'BT', flag: '🇧🇹', phoneCode: '+975'),
    Country(code: 'BV', flag: '🇧🇻', phoneCode: '+47'),
    Country(code: 'BW', flag: '🇧🇼', phoneCode: '+267'),
    Country(code: 'BY', flag: '🇧🇾', phoneCode: '+375'),
    Country(code: 'BZ', flag: '🇧🇿', phoneCode: '+501'),
    Country(code: 'CA', flag: '🇨🇦', phoneCode: '+1'),
    Country(code: 'CC', flag: '🇨🇨', phoneCode: '+61'),
    Country(code: 'CD', flag: '🇨🇩', phoneCode: '+243'),
    Country(code: 'CF', flag: '🇨🇫', phoneCode: '+236'),
    Country(code: 'CG', flag: '🇨🇬', phoneCode: '+242'),
    Country(code: 'CH', flag: '🇨🇭', phoneCode: '+41'),
    Country(code: 'CI', flag: '🇨🇮', phoneCode: '+225'),
    Country(code: 'CK', flag: '🇨🇰', phoneCode: '+682'),
    Country(code: 'CL', flag: '🇨🇱', phoneCode: '+56'),
    Country(code: 'CM', flag: '🇨🇲', phoneCode: '+237'),
    Country(code: 'CN', flag: '🇨🇳', phoneCode: '+86'),
    Country(code: 'CO', flag: '🇨🇴', phoneCode: '+57'),
    Country(code: 'CR', flag: '🇨🇷', phoneCode: '+506'),
    Country(code: 'CU', flag: '🇨🇺', phoneCode: '+53'),
    Country(code: 'CV', flag: '🇨🇻', phoneCode: '+238'),
    Country(code: 'CW', flag: '🇨🇼', phoneCode: '+599'),
    Country(code: 'CX', flag: '🇨🇽', phoneCode: '+61'),
    Country(code: 'CY', flag: '🇨🇾', phoneCode: '+357'),
    Country(code: 'CZ', flag: '🇨🇿', phoneCode: '+420'),
    Country(code: 'DE', flag: '🇩🇪', phoneCode: '+49'),
    Country(code: 'DJ', flag: '🇩🇯', phoneCode: '+253'),
    Country(code: 'DK', flag: '🇩🇰', phoneCode: '+45'),
    Country(code: 'DM', flag: '🇩🇲', phoneCode: '+1767'),
    Country(code: 'DO', flag: '🇩🇴', phoneCode: '+1809'),
    Country(code: 'DZ', flag: '🇩🇿', phoneCode: '+213'),
    Country(code: 'EC', flag: '🇪🇨', phoneCode: '+593'),
    Country(code: 'EE', flag: '🇪🇪', phoneCode: '+372'),
    Country(code: 'EG', flag: '🇪🇬', phoneCode: '+20'),
    Country(code: 'EH', flag: '🇪🇭', phoneCode: '+212'),
    Country(code: 'ER', flag: '🇪🇷', phoneCode: '+291'),
    Country(code: 'ES', flag: '🇪🇸', phoneCode: '+34'),
    Country(code: 'ET', flag: '🇪🇹', phoneCode: '+251'),
    Country(code: 'FI', flag: '🇫🇮', phoneCode: '+358'),
    Country(code: 'FK', flag: '🇫🇰', phoneCode: '+500'),
    Country(code: 'FJ', flag: '🇫🇯', phoneCode: '+679'),
    Country(code: 'FM', flag: '🇫🇲', phoneCode: '+691'),
    Country(code: 'FO', flag: '🇫🇴', phoneCode: '+298'),
    Country(code: 'FR', flag: '🇫🇷', phoneCode: '+33'),
    Country(code: 'GA', flag: '🇬🇦', phoneCode: '+241'),
    Country(code: 'GB', flag: '🇬🇧', phoneCode: '+44'),
    Country(code: 'GD', flag: '🇬🇩', phoneCode: '+1473'),
    Country(code: 'GE', flag: '🇬🇪', phoneCode: '+995'),
    Country(code: 'GF', flag: '🇬🇫', phoneCode: '+594'),
    Country(code: 'GG', flag: '🇬🇬', phoneCode: '+44'),
    Country(code: 'GH', flag: '🇬🇭', phoneCode: '+233'),
    Country(code: 'GI', flag: '🇬🇮', phoneCode: '+350'),
    Country(code: 'GL', flag: '🇬🇱', phoneCode: '+299'),
    Country(code: 'GM', flag: '🇬🇲', phoneCode: '+220'),
    Country(code: 'GN', flag: '🇬🇳', phoneCode: '+224'),
    Country(code: 'GP', flag: '🇬🇵', phoneCode: '+590'),
    Country(code: 'GQ', flag: '🇬🇶', phoneCode: '+240'),
    Country(code: 'GR', flag: '🇬🇷', phoneCode: '+30'),
    Country(code: 'GS', flag: '🇬🇸', phoneCode: '+500'),
    Country(code: 'GT', flag: '🇬🇹', phoneCode: '+502'),
    Country(code: 'GU', flag: '🇬🇺', phoneCode: '+1671'),
    Country(code: 'GW', flag: '🇬🇼', phoneCode: '+245'),
    Country(code: 'GY', flag: '🇬🇾', phoneCode: '+592'),
    Country(code: 'HK', flag: '🇭🇰', phoneCode: '+852'),
    Country(code: 'HM', flag: '🇭🇲', phoneCode: '+672'),
    Country(code: 'HN', flag: '🇭🇳', phoneCode: '+504'),
    Country(code: 'HR', flag: '🇭🇷', phoneCode: '+385'),
    Country(code: 'HT', flag: '🇭🇹', phoneCode: '+509'),
    Country(code: 'HU', flag: '🇭🇺', phoneCode: '+36'),
    Country(code: 'ID', flag: '🇮🇩', phoneCode: '+62'),
    Country(code: 'IE', flag: '🇮🇪', phoneCode: '+353'),
    Country(code: 'IL', flag: '🇮🇱', phoneCode: '+972'),
    Country(code: 'IM', flag: '🇮🇲', phoneCode: '+44'),
    Country(code: 'IN', flag: '🇮🇳', phoneCode: '+91'),
    Country(code: 'IO', flag: '🇮🇴', phoneCode: '+672'),
    Country(code: 'IQ', flag: '🇮🇶', phoneCode: '+964'),
    Country(code: 'IR', flag: '🇮🇷', phoneCode: '+98'),
    Country(code: 'IS', flag: '🇮🇸', phoneCode: '+354'),
    Country(code: 'IT', flag: '🇮🇹', phoneCode: '+39'),
    Country(code: 'JE', flag: '🇯🇪', phoneCode: '+44'),
    Country(code: 'JM', flag: '🇯🇲', phoneCode: '+1876'),
    Country(code: 'JO', flag: '🇯🇴', phoneCode: '+962'),
    Country(code: 'JP', flag: '🇯🇵', phoneCode: '+81'),
    Country(code: 'KE', flag: '🇰🇪', phoneCode: '+254'),
    Country(code: 'KG', flag: '🇰🇬', phoneCode: '+996'),
    Country(code: 'KH', flag: '🇰🇭', phoneCode: '+855'),
    Country(code: 'KI', flag: '🇰🇮', phoneCode: '+686'),
    Country(code: 'KM', flag: '🇰🇲', phoneCode: '+269'),
    Country(code: 'KN', flag: '🇰🇳', phoneCode: '+1869'),
    Country(code: 'KP', flag: '🇰🇵', phoneCode: '+850'),
    Country(code: 'KR', flag: '🇰🇷', phoneCode: '+82'),
    Country(code: 'KW', flag: '🇰🇼', phoneCode: '+965'),
    Country(code: 'KY', flag: '🇰🇾', phoneCode: '+1345'),
    Country(code: 'KZ', flag: '🇰🇿', phoneCode: '+7'),
    Country(code: 'LA', flag: '🇱🇦', phoneCode: '+856'),
    Country(code: 'LB', flag: '🇱🇧', phoneCode: '+961'),
    Country(code: 'LC', flag: '🇱🇨', phoneCode: '+1758'),
    Country(code: 'LI', flag: '🇱🇮', phoneCode: '+423'),
    Country(code: 'LK', flag: '🇱🇰', phoneCode: '+94'),
    Country(code: 'LR', flag: '🇱🇷', phoneCode: '+231'),
    Country(code: 'LS', flag: '🇱🇸', phoneCode: '+266'),
    Country(code: 'LT', flag: '🇱🇹', phoneCode: '+370'),
    Country(code: 'LU', flag: '🇱🇺', phoneCode: '+352'),
    Country(code: 'LV', flag: '🇱🇻', phoneCode: '+371'),
    Country(code: 'LY', flag: '🇱🇾', phoneCode: '+218'),
    Country(code: 'MA', flag: '🇲🇦', phoneCode: '+212'),
    Country(code: 'MC', flag: '🇲🇨', phoneCode: '+377'),
    Country(code: 'MD', flag: '🇲🇩', phoneCode: '+373'),
    Country(code: 'ME', flag: '🇲🇪', phoneCode: '+382'),
    Country(code: 'MF', flag: '🇲🇫', phoneCode: '+590'),
    Country(code: 'MG', flag: '🇲🇬', phoneCode: '+261'),
    Country(code: 'MH', flag: '🇲🇭', phoneCode: '+692'),
    Country(code: 'MK', flag: '🇲🇰', phoneCode: '+389'),
    Country(code: 'ML', flag: '🇲🇱', phoneCode: '+223'),
    Country(code: 'MM', flag: '🇲🇲', phoneCode: '+95'),
    Country(code: 'MN', flag: '🇲🇳', phoneCode: '+976'),
    Country(code: 'MO', flag: '🇲🇴', phoneCode: '+853'),
    Country(code: 'MP', flag: '🇲🇵', phoneCode: '+1670'),
    Country(code: 'MQ', flag: '🇲🇶', phoneCode: '+596'),
    Country(code: 'MR', flag: '🇲🇷', phoneCode: '+222'),
    Country(code: 'MS', flag: '🇲🇸', phoneCode: '+1664'),
    Country(code: 'MT', flag: '🇲🇹', phoneCode: '+356'),
    Country(code: 'MU', flag: '🇲🇺', phoneCode: '+230'),
    Country(code: 'MV', flag: '🇲🇻', phoneCode: '+960'),
    Country(code: 'MW', flag: '🇲🇼', phoneCode: '+265'),
    Country(code: 'MX', flag: '🇲🇽', phoneCode: '+52'),
    Country(code: 'MY', flag: '🇲🇾', phoneCode: '+60'),
    Country(code: 'MZ', flag: '🇲🇿', phoneCode: '+258'),
    Country(code: 'NA', flag: '🇳🇦', phoneCode: '+264'),
    Country(code: 'NC', flag: '🇳🇨', phoneCode: '+687'),
    Country(code: 'NE', flag: '🇳🇪', phoneCode: '+227'),
    Country(code: 'NF', flag: '🇳🇫', phoneCode: '+672'),
    Country(code: 'NG', flag: '🇳🇬', phoneCode: '+234'),
    Country(code: 'NI', flag: '🇳🇮', phoneCode: '+505'),
    Country(code: 'NL', flag: '🇳🇱', phoneCode: '+31'),
    Country(code: 'NO', flag: '🇳🇴', phoneCode: '+47'),
    Country(code: 'NP', flag: '🇳🇵', phoneCode: '+977'),
    Country(code: 'NR', flag: '🇳🇷', phoneCode: '+674'),
    Country(code: 'NU', flag: '🇳🇺', phoneCode: '+683'),
    Country(code: 'NZ', flag: '🇳🇿', phoneCode: '+64'),
    Country(code: 'OM', flag: '🇴🇲', phoneCode: '+968'),
    Country(code: 'PA', flag: '🇵🇦', phoneCode: '+507'),
    Country(code: 'PE', flag: '🇵🇪', phoneCode: '+51'),
    Country(code: 'PF', flag: '🇵🇫', phoneCode: '+689'),
    Country(code: 'PG', flag: '🇵🇬', phoneCode: '+675'),
    Country(code: 'PH', flag: '🇵🇭', phoneCode: '+63'),
    Country(code: 'PK', flag: '🇵🇰', phoneCode: '+92'),
    Country(code: 'PL', flag: '🇵🇱', phoneCode: '+48'),
    Country(code: 'PM', flag: '🇵🇲', phoneCode: '+508'),
    Country(code: 'PN', flag: '🇵🇳', phoneCode: '+64'),
    Country(code: 'PR', flag: '🇵🇷', phoneCode: '+1787'),
    Country(code: 'PS', flag: '🇵🇸', phoneCode: '+970'),
    Country(code: 'PT', flag: '🇵🇹', phoneCode: '+351'),
    Country(code: 'PW', flag: '🇵🇼', phoneCode: '+680'),
    Country(code: 'PY', flag: '🇵🇾', phoneCode: '+595'),
    Country(code: 'QA', flag: '🇶🇦', phoneCode: '+974'),
    Country(code: 'RE', flag: '🇷🇪', phoneCode: '+262'),
    Country(code: 'RO', flag: '🇷🇴', phoneCode: '+40'),
    Country(code: 'RS', flag: '🇷🇸', phoneCode: '+381'),
    Country(code: 'RU', flag: '🇷🇺', phoneCode: '+7'),
    Country(code: 'RW', flag: '🇷🇼', phoneCode: '+250'),
    Country(code: 'SA', flag: '🇸🇦', phoneCode: '+966'),
    Country(code: 'SB', flag: '🇸🇧', phoneCode: '+677'),
    Country(code: 'SC', flag: '🇸🇨', phoneCode: '+248'),
    Country(code: 'SD', flag: '🇸🇩', phoneCode: '+249'),
    Country(code: 'SE', flag: '🇸🇪', phoneCode: '+46'),
    Country(code: 'SG', flag: '🇸🇬', phoneCode: '+65'),
    Country(code: 'SH', flag: '🇸🇭', phoneCode: '+290'),
    Country(code: 'SI', flag: '🇸🇮', phoneCode: '+386'),
    Country(code: 'SJ', flag: '🇸🇯', phoneCode: '+47'),
    Country(code: 'SK', flag: '🇸🇰', phoneCode: '+421'),
    Country(code: 'SL', flag: '🇸🇱', phoneCode: '+232'),
    Country(code: 'SM', flag: '🇸🇲', phoneCode: '+378'),
    Country(code: 'SN', flag: '🇸🇳', phoneCode: '+221'),
    Country(code: 'SO', flag: '🇸🇴', phoneCode: '+252'),
    Country(code: 'SR', flag: '🇸🇷', phoneCode: '+597'),
    Country(code: 'SS', flag: '🇸🇸', phoneCode: '+211'),
    Country(code: 'ST', flag: '🇸🇹', phoneCode: '+239'),
    Country(code: 'SV', flag: '🇸🇻', phoneCode: '+503'),
    Country(code: 'SX', flag: '🇸🇽', phoneCode: '+1721'),
    Country(code: 'SY', flag: '🇸🇾', phoneCode: '+963'),
    Country(code: 'SZ', flag: '🇸🇿', phoneCode: '+268'),
    Country(code: 'TA', flag: '🇹🇦', phoneCode: '+290'),
    Country(code: 'TC', flag: '🇹🇨', phoneCode: '+1649'),
    Country(code: 'TD', flag: '🇹🇩', phoneCode: '+235'),
    Country(code: 'TF', flag: '🇹🇫', phoneCode: '+262'),
    Country(code: 'TG', flag: '🇹🇬', phoneCode: '+228'),
    Country(code: 'TH', flag: '🇹🇭', phoneCode: '+66'),
    Country(code: 'TJ', flag: '🇹🇯', phoneCode: '+992'),
    Country(code: 'TK', flag: '🇹🇰', phoneCode: '+690'),
    Country(code: 'TL', flag: '🇹🇱', phoneCode: '+670'),
    Country(code: 'TM', flag: '🇹🇲', phoneCode: '+993'),
    Country(code: 'TN', flag: '🇹🇳', phoneCode: '+216'),
    Country(code: 'TO', flag: '🇹🇴', phoneCode: '+676'),
    Country(code: 'TR', flag: '🇹🇷', phoneCode: '+90'),
    Country(code: 'TT', flag: '🇹🇹', phoneCode: '+1868'),
    Country(code: 'TV', flag: '🇹🇻', phoneCode: '+688'),
    Country(code: 'TW', flag: '🇹🇼', phoneCode: '+886'),
    Country(code: 'TZ', flag: '🇹🇿', phoneCode: '+255'),
    Country(code: 'UA', flag: '🇺🇦', phoneCode: '+380'),
    Country(code: 'UG', flag: '🇺🇬', phoneCode: '+256'),
    Country(code: 'UM', flag: '🇺🇲', phoneCode: '+1'),
    Country(code: 'US', flag: '🇺🇸', phoneCode: '+1'),
    Country(code: 'UY', flag: '🇺🇾', phoneCode: '+598'),
    Country(code: 'UZ', flag: '🇺🇿', phoneCode: '+998'),
    Country(code: 'VA', flag: '🇻🇦', phoneCode: '+379'),
    Country(code: 'VC', flag: '🇻🇨', phoneCode: '+1784'),
    Country(code: 'VE', flag: '🇻🇪', phoneCode: '+58'),
    Country(code: 'VG', flag: '🇻🇬', phoneCode: '+1284'),
    Country(code: 'VI', flag: '🇻🇮', phoneCode: '+1340'),
    Country(code: 'VN', flag: '🇻🇳', phoneCode: '+84'),
    Country(code: 'VU', flag: '🇻🇺', phoneCode: '+678'),
    Country(code: 'WS', flag: '🇼🇸', phoneCode: '+685'),
    Country(code: 'WF', flag: '🇼🇫', phoneCode: '+681'),
    Country(code: 'YE', flag: '🇾🇪', phoneCode: '+967'),
    Country(code: 'YT', flag: '🇾🇹', phoneCode: '+262'),
    Country(code: 'ZA', flag: '🇿🇦', phoneCode: '+27'),
    Country(code: 'ZM', flag: '🇿🇲', phoneCode: '+260'),
    Country(code: 'ZW', flag: '🇿🇼', phoneCode: '+263'),
    Country(code: 'XK', flag: '🇽🇰', phoneCode: '+383'),
  ];

  static final Map<String, Country> _countriesByCode = {
    for (final country in countries) country.code: country,
  };

  static final Map<String, Country> _countriesByPhoneCode = _buildByPhoneCode();

  static Map<String, Country> _buildByPhoneCode() {
    final map = <String, Country>{};
    for (final country in countries) {
      // Keep first country for shared phone codes to preserve existing behavior.
      map.putIfAbsent(country.phoneCode, () => country);
    }
    return map;
  }

  /// Get a country by its ISO code
  ///
  /// Returns null if the country code is not found
  static Country? getCountryByCode(String code) {
    return _countriesByCode[code.toUpperCase()];
  }

  /// Get a country by its phone code
  ///
  /// Returns null if the phone code is not found
  static Country? getCountryByPhoneCode(String phoneCode) {
    return _countriesByPhoneCode[phoneCode];
  }

  /// Get a sorted list of countries based on localized names
  ///
  /// [getCountryName] should be a function that returns the localized name for a country code
  static List<Country> getSortedCountries(
    String Function(String) getCountryName,
  ) {
    final sortedCountries = List<Country>.from(countries);

    sortedCountries.sort((a, b) {
      final nameA = getCountryName(a.code).toLowerCase();
      final nameB = getCountryName(b.code).toLowerCase();
      return nameA.compareTo(nameB);
    });

    return sortedCountries;
  }

  /// Search countries by name, code, or phone code
  ///
  /// [query] is the search term
  /// [getCountryName] should be a function that returns the localized name for a country code
  static List<Country> searchCountries(
    String query,
    String Function(String) getCountryName,
  ) {
    if (query.isEmpty) return countries;

    final lowercaseQuery = query.toLowerCase().trim();
    final results = <Country>[];
    final exactMatches = <Country>[];
    final startsWithMatches = <Country>[];
    final containsMatches = <Country>[];

    for (final country in countries) {
      final countryName = getCountryName(country.code).toLowerCase();
      final countryCode = country.code.toLowerCase();
      final countryPhoneCode = country.phoneCode.toLowerCase();

      // Exact match
      if (countryName == lowercaseQuery ||
          countryCode == lowercaseQuery ||
          countryPhoneCode == lowercaseQuery) {
        exactMatches.add(country);
      }
      // Starts with query
      else if (countryName.startsWith(lowercaseQuery) ||
          countryCode.startsWith(lowercaseQuery) ||
          countryPhoneCode.startsWith(lowercaseQuery)) {
        startsWithMatches.add(country);
      }
      // Contains query
      else if (countryName.contains(lowercaseQuery) ||
          countryCode.contains(lowercaseQuery) ||
          countryPhoneCode.contains(lowercaseQuery)) {
        containsMatches.add(country);
      }
    }

    // Combine results in priority order
    results.addAll(exactMatches);
    results.addAll(startsWithMatches);
    results.addAll(containsMatches);

    return results;
  }

  /// Search countries by phone code only
  ///
  /// [phoneCode] is the phone code to search for (e.g., '+1', '+7')
  static List<Country> searchByPhoneCode(String phoneCode) {
    if (phoneCode.isEmpty) return countries;

    final results = countries
        .where((country) => country.phoneCode.contains(phoneCode))
        .toList();

    return results;
  }
}
