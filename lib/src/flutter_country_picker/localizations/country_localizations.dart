import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'country_localizations_ar.dart';
import 'country_localizations_de.dart';
import 'country_localizations_en.dart';
import 'country_localizations_es.dart';
import 'country_localizations_fr.dart';
import 'country_localizations_hi.dart';
import 'country_localizations_id.dart';
import 'country_localizations_it.dart';
import 'country_localizations_ja.dart';
import 'country_localizations_ko.dart';
import 'country_localizations_nl.dart';
import 'country_localizations_pl.dart';
import 'country_localizations_pt.dart';
import 'country_localizations_ru.dart';
import 'country_localizations_tr.dart';
import 'country_localizations_uk.dart';
import 'country_localizations_vi.dart';
import 'country_localizations_th.dart';
import 'country_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized country names with an instance of CountryLocalizations
/// returned by `CountryLocalizations.of(context)`.
abstract class CountryLocalizations {
  /// Creates a new CountryLocalizations instance.
  ///
  /// [locale] - The locale identifier (e.g., 'en', 'ru', 'ko')
  CountryLocalizations(String locale);

  // Removed unused localeName field

  /// Get the CountryLocalizations instance for the current context
  /// Returns fallback English localization if delegates are not configured
  static CountryLocalizations of(BuildContext context) {
    try {
      final localizations = Localizations.of<CountryLocalizations>(
        context,
        CountryLocalizations,
      );
      if (localizations != null) {
        return localizations;
      }
    } catch (e) {
      if (kDebugMode) {}
    }

    // Fallback to English if delegates are not configured
    return CountryLocalizationsEn();
  }

  /// Safe way to get country name with fallback
  /// Returns localized name or country code if localization fails
  static String getCountryNameSafe(BuildContext context, String countryCode) {
    try {
      return of(context).getCountryName(countryCode);
    } catch (e) {
      if (kDebugMode) {}
      return countryCode; // Fallback to country code
    }
  }

  /// Localizations delegate for CountryLocalizations
  static const LocalizationsDelegate<CountryLocalizations> delegate =
      _CountryLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[delegate];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('ru'),
    Locale('tr'),
    Locale('uk'),
    Locale('vi'),
    Locale('th'),
    Locale('zh'),
  ];

  /// Get country name by country code
  ///
  /// Returns the localized name for the given country code
  /// If the country code is not found, returns the code itself
  String getCountryName(String countryCode);

  /// Get all country names as a map
  ///
  /// Returns a map where keys are country codes and values are localized names
  Map<String, String> get allCountryNames;

  /// Get the localized text for "Select Country"
  String get selectCountry;

  /// Get the localized text for "Search country..."
  String get searchCountry;

  /// Get the localized text for "Select your country"
  String get selectYourCountry;

  /// Get the localized text for "All countries"
  String get allCountries;
}

class _CountryLocalizationsDelegate
    extends LocalizationsDelegate<CountryLocalizations> {
  const _CountryLocalizationsDelegate();

  @override
  Future<CountryLocalizations> load(Locale locale) {
    return SynchronousFuture<CountryLocalizations>(
      lookupCountryLocalizations(locale),
    );
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'ar',
        'de',
        'en',
        'es',
        'fr',
        'hi',
        'id',
        'it',
        'ja',
        'ko',
        'nl',
        'pl',
        'pt',
        'ru',
        'tr',
        'uk',
        'vi',
        'th',
        'zh',
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_CountryLocalizationsDelegate old) => false;
}

/// Lookup function to get the appropriate CountryLocalizations instance
///
/// Returns the correct localization class based on the provided locale
/// Falls back to English if the locale is not supported
CountryLocalizations lookupCountryLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return CountryLocalizationsAr();
    case 'de':
      return CountryLocalizationsDe();
    case 'en':
      return CountryLocalizationsEn();
    case 'es':
      return CountryLocalizationsEs();
    case 'fr':
      return CountryLocalizationsFr();
    case 'hi':
      return CountryLocalizationsHi();
    case 'id':
      return CountryLocalizationsId();
    case 'it':
      return CountryLocalizationsIt();
    case 'ja':
      return CountryLocalizationsJa();
    case 'ko':
      return CountryLocalizationsKo();
    case 'nl':
      return CountryLocalizationsNl();
    case 'pl':
      return CountryLocalizationsPl();
    case 'pt':
      return CountryLocalizationsPt();
    case 'ru':
      return CountryLocalizationsRu();
    case 'tr':
      return CountryLocalizationsTr();
    case 'uk':
      return CountryLocalizationsUk();
    case 'vi':
      return CountryLocalizationsVi();
    case 'th':
      return CountryLocalizationsTh();
    case 'zh':
      return CountryLocalizationsZh();
  }

  // Fallback to English for unsupported locales
  if (kDebugMode) {}
  return CountryLocalizationsEn();
}
