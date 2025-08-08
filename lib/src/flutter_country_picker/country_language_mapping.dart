import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// Utility class for mapping languages to countries
/// Used for suggested countries based on app locale
class CountryLanguageMapping {
  const CountryLanguageMapping._();

  /// Get suggested countries for a given language code
  /// Returns a list of country codes that speak the specified language, sorted by population
  static List<String> getSuggestedCountries(String languageCode) {
    List<String> countries;

    switch (languageCode.toLowerCase()) {
      case 'fr':
        countries = _frenchSpeakingCountries;
        break;
      case 'es':
        countries = _spanishSpeakingCountries;
        break;
      case 'de':
        countries = _germanSpeakingCountries;
        break;
      case 'it':
        countries = _italianSpeakingCountries;
        break;
      case 'pt':
        countries = _portugueseSpeakingCountries;
        break;
      case 'ru':
        countries = _russianSpeakingCountries;
        break;
      case 'ar':
        countries = _arabicSpeakingCountries;
        break;
      case 'zh':
        countries = _chineseSpeakingCountries;
        break;
      case 'ja':
        countries = _japaneseSpeakingCountries;
        break;
      case 'ko':
        countries = _koreanSpeakingCountries;
        break;
      case 'hi':
        countries = _hindiSpeakingCountries;
        break;
      case 'tr':
        countries = _turkishSpeakingCountries;
        break;
      case 'pl':
        countries = _polishSpeakingCountries;
        break;
      case 'uk':
        countries = _ukrainianSpeakingCountries;
        break;
      case 'vi':
        countries = _vietnameseSpeakingCountries;
        break;
      case 'th':
        countries = _thaiSpeakingCountries;
        break;
      case 'id':
        countries = _indonesianSpeakingCountries;
        break;
      case 'nl':
        countries = _dutchSpeakingCountries;
        break;
      default:
        countries = _englishSpeakingCountries;
        break;
    }

    // Countries are already sorted by population (descending)
    return countries;
  }

  /// French speaking countries (sorted by population descending)
  static const List<String> _frenchSpeakingCountries = [
    'CD', // Democratic Republic of the Congo (102M)
    'FR', // France (68M)
    'DZ', // Algeria (45M)
    'CA', // Canada (38M)
    'MA', // Morocco (37M)
    'CI', // Ivory Coast (28M)
    'CM', // Cameroon (27M)
    'MG', // Madagascar (30M)
    'SN', // Senegal (17M)
    'BF', // Burkina Faso (22M)
    'ML', // Mali (23M)
    'NE', // Niger (27M)
    'TD', // Chad (18M)
    'TG', // Togo (9M)
    'BJ', // Benin (13M)
    'RW', // Rwanda (14M)
    'BI', // Burundi (13M)
    'CF', // Central African Republic (6M)
    'CG', // Republic of the Congo (6M)
    'GA', // Gabon (2M)
    'GQ', // Equatorial Guinea (2M)
    'DJ', // Djibouti (1M)
    'KM', // Comoros (0M)
    'VU', // Vanuatu (0M)
    'HT', // Haiti (12M)
    'LB', // Lebanon (7M)
    'SY', // Syria (23M)
    'TN', // Tunisia (12M)
    'BE', // Belgium (12M)
    'CH', // Switzerland (9M)
    'LU', // Luxembourg (1M)
    'MC', // Monaco (0M)
    'GF', // French Guiana (0M)
    'PF', // French Polynesia (0M)
    'NC', // New Caledonia (0M)
    'RE', // Réunion (1M)
    'BL', // Saint Barthélemy (0M)
    'MF', // Saint Martin (0M)
    'PM', // Saint Pierre and Miquelon (0M)
    'WF', // Wallis and Futuna (0M)
    'YT', // Mayotte (0M)
  ];

  /// Spanish speaking countries (sorted by population descending)
  static const List<String> _spanishSpeakingCountries = [
    'US', // United States (339M)
    'MX', // Mexico (128M)
    'PH', // Philippines (117M)
    'CO', // Colombia (52M)
    'ES', // Spain (47M)
    'AR', // Argentina (46M)
    'PE', // Peru (34M)
    'VE', // Venezuela (28M)
    'CL', // Chile (19M)
    'EC', // Ecuador (18M)
    'GT', // Guatemala (18M)
    'BO', // Bolivia (12M)
    'CU', // Cuba (11M)
    'DO', // Dominican Republic (11M)
    'HN', // Honduras (10M)
    'PY', // Paraguay (7M)
    'NI', // Nicaragua (7M)
    'SV', // El Salvador (6M)
    'CR', // Costa Rica (5M)
    'PA', // Panama (4M)
    'UY', // Uruguay (3M)
    'GQ', // Equatorial Guinea (2M)
  ];

  /// German speaking countries (sorted by population descending)
  static const List<String> _germanSpeakingCountries = [
    'DE', // Germany (84M)
    'IT', // Italy (60M)
    'BE', // Belgium (12M)
    'AT', // Austria (9M)
    'CH', // Switzerland (9M)
    'LU', // Luxembourg (1M)
    'LI', // Liechtenstein (0M)
  ];

  /// Italian speaking countries (sorted by population descending)
  static const List<String> _italianSpeakingCountries = [
    'IT', // Italy (60M)
    'CH', // Switzerland (9M)
    'HR', // Croatia (4M)
    'SI', // Slovenia (2M)
    'SM', // San Marino (0M)
    'VA', // Vatican City (0M)
  ];

  /// Portuguese speaking countries (sorted by population descending)
  static const List<String> _portugueseSpeakingCountries = [
    'BR', // Brazil (216M)
    'AO', // Angola (36M)
    'PT', // Portugal (10M)
    'MZ', // Mozambique (33M)
    'GW', // Guinea-Bissau (2M)
    'CV', // Cape Verde (0M)
    'ST', // São Tomé and Príncipe (0M)
    'TL', // East Timor (0M)
    'MO', // Macau (0M)
  ];

  /// Russian speaking countries (sorted by population descending)
  static const List<String> _russianSpeakingCountries = [
    'RU', // Russia (144M)
    'UA', // Ukraine (43M)
    'UZ', // Uzbekistan (35M)
    'KZ', // Kazakhstan (19M)
    'TJ', // Tajikistan (10M)
    'KG', // Kyrgyzstan (7M)
    'TM', // Turkmenistan (6M)
    'MD', // Moldova (3M)
    'GE', // Georgia (4M)
    'AM', // Armenia (3M)
    'AZ', // Azerbaijan (10M)
    'BY', // Belarus (9M)
  ];

  /// Arabic speaking countries (sorted by population descending)
  static const List<String> _arabicSpeakingCountries = [
    'EG', // Egypt (112M)
    'SD', // Sudan (48M)
    'IQ', // Iraq (45M)
    'DZ', // Algeria (45M)
    'MA', // Morocco (37M)
    'SA', // Saudi Arabia (36M)
    'YE', // Yemen (34M)
    'SY', // Syria (23M)
    'JO', // Jordan (11M)
    'LY', // Libya (7M)
    'TN', // Tunisia (12M)
    'AE', // United Arab Emirates (10M)
    'KW', // Kuwait (4M)
    'OM', // Oman (5M)
    'LB', // Lebanon (7M)
    'QA', // Qatar (3M)
    'BH', // Bahrain (2M)
    'TD', // Chad (18M)
    'SO', // Somalia (18M)
    'DJ', // Djibouti (1M)
    'KM', // Comoros (0M)
    'ER', // Eritrea (4M)
    'PS', // Palestine (0M)
  ];

  /// Chinese speaking countries (sorted by population descending)
  static const List<String> _chineseSpeakingCountries = [
    'CN', // China (1439M)
    'MY', // Malaysia (34M)
    'TW', // Taiwan (23M)
    'HK', // Hong Kong (7M)
    'SG', // Singapore (6M)
    'MO', // Macau (0M)
  ];

  /// Japanese speaking countries
  static const List<String> _japaneseSpeakingCountries = [
    'JP', // Japan
  ];

  /// Korean speaking countries
  static const List<String> _koreanSpeakingCountries = [
    'KR', // South Korea
    'KP', // North Korea
  ];

  /// Hindi speaking countries
  static const List<String> _hindiSpeakingCountries = [
    'IN', // India
    'NP', // Nepal
    'FJ', // Fiji
  ];

  /// Turkish speaking countries (sorted by population descending)
  static const List<String> _turkishSpeakingCountries = [
    'TR', // Turkey (85M)
    'UZ', // Uzbekistan (35M)
    'KZ', // Kazakhstan (19M)
    'AZ', // Azerbaijan (10M)
    'KG', // Kyrgyzstan (7M)
    'TM', // Turkmenistan (6M)
    'CY', // Cyprus (1M)
  ];

  /// Polish speaking countries
  static const List<String> _polishSpeakingCountries = [
    'PL', // Poland
  ];

  /// Ukrainian speaking countries
  static const List<String> _ukrainianSpeakingCountries = [
    'UA', // Ukraine
  ];

  /// Vietnamese speaking countries
  static const List<String> _vietnameseSpeakingCountries = [
    'VN', // Vietnam
  ];

  /// Thai speaking countries
  static const List<String> _thaiSpeakingCountries = [
    'TH', // Thailand
  ];

  /// Indonesian speaking countries
  static const List<String> _indonesianSpeakingCountries = [
    'ID', // Indonesia
  ];

  /// Dutch speaking countries (sorted by population descending)
  static const List<String> _dutchSpeakingCountries = [
    'NL', // Netherlands (17M)
    'BE', // Belgium (12M)
    'SR', // Suriname (0M)
  ];

  /// English speaking countries (fallback)
  static const List<String> _englishSpeakingCountries = [
    'US', // United States
    'GB', // United Kingdom
    'CA', // Canada
    'AU', // Australia
    'NZ', // New Zealand
    'IE', // Ireland
    'ZA', // South Africa
    'IN', // India
    'PK', // Pakistan
    'NG', // Nigeria
    'KE', // Kenya
    'UG', // Uganda
    'TZ', // Tanzania
    'ZW', // Zimbabwe
    'ZM', // Zambia
    'MW', // Malawi
    'BW', // Botswana
    'NA', // Namibia
    'SZ', // Eswatini
    'LS', // Lesotho
    'MU', // Mauritius
    'SC', // Seychelles
    'FJ', // Fiji
    'PG', // Papua New Guinea
    'SB', // Solomon Islands
    'VU', // Vanuatu
    'TO', // Tonga
    'WS', // Samoa
    'KI', // Kiribati
    'TV', // Tuvalu
    'NR', // Nauru
    'PW', // Palau
    'MH', // Marshall Islands
    'FM', // Micronesia
    'CK', // Cook Islands
    'NU', // Niue
    'TK', // Tokelau
    'AS', // American Samoa
    'GU', // Guam
    'MP', // Northern Mariana Islands
    'VI', // U.S. Virgin Islands
    'AI', // Anguilla
    'BM', // Bermuda
    'IO', // British Indian Ocean Territory
    'VG', // British Virgin Islands
    'KY', // Cayman Islands
    'FK', // Falkland Islands
    'GI', // Gibraltar
    'MS', // Montserrat
    'PN', // Pitcairn Islands
    'SH', // Saint Helena
    'TC', // Turks and Caicos Islands
    'GG', // Guernsey
    'IM', // Isle of Man
    'JE', // Jersey
    'HK', // Hong Kong
    'SG', // Singapore
    'MY', // Malaysia
    'PH', // Philippines
    'MT', // Malta
    'CY', // Cyprus
  ];

  /// Get the current app locale language code
  static String getCurrentLanguageCode(BuildContext context) {
    final locale = Localizations.localeOf(context);
    if (kDebugMode) {}
    return locale.languageCode;
  }

  /// Check if a country is in the suggested list for current locale
  static bool isSuggestedCountry(BuildContext context, String countryCode) {
    final languageCode = getCurrentLanguageCode(context);
    final suggestedCountries = getSuggestedCountries(languageCode);
    return suggestedCountries.contains(countryCode);
  }
}
