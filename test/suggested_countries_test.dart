import 'package:country_search/src/flutter_country_picker/country_data.dart';
import 'package:country_search/src/flutter_country_picker/country_language_mapping.dart';
import 'package:country_search/src/flutter_country_picker/country_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Suggested Countries Tests', () {
    test(
      'CountryLanguageMapping returns correct suggested countries for French',
      () {
        final frenchCountries = CountryLanguageMapping.getSuggestedCountries(
          'fr',
        );

        expect(frenchCountries, contains('FR')); // France
        expect(frenchCountries, contains('CA')); // Canada
        expect(frenchCountries, contains('BE')); // Belgium
        expect(frenchCountries, contains('CH')); // Switzerland
        expect(frenchCountries, isNotEmpty);

        if (kDebugMode) {
          debugPrint(
            'DEBUG: French speaking countries: ${frenchCountries.length}',
          );
        }
      },
    );

    test(
      'CountryLanguageMapping returns correct suggested countries for Spanish',
      () {
        final spanishCountries = CountryLanguageMapping.getSuggestedCountries(
          'es',
        );

        expect(spanishCountries, contains('ES')); // Spain
        expect(spanishCountries, contains('MX')); // Mexico
        expect(spanishCountries, contains('AR')); // Argentina
        expect(spanishCountries, isNotEmpty);

        if (kDebugMode) {
          debugPrint(
            'DEBUG: Spanish speaking countries: ${spanishCountries.length}',
          );
        }
      },
    );

    test(
      'CountryLanguageMapping returns correct suggested countries for German',
      () {
        final germanCountries = CountryLanguageMapping.getSuggestedCountries(
          'de',
        );

        expect(germanCountries, contains('DE')); // Germany
        expect(germanCountries, contains('AT')); // Austria
        expect(germanCountries, contains('CH')); // Switzerland
        expect(germanCountries, isNotEmpty);

        if (kDebugMode) {
          debugPrint(
            'DEBUG: German speaking countries: ${germanCountries.length}',
          );
        }
      },
    );

    test('CountryLanguageMapping returns English countries as fallback', () {
      final englishCountries = CountryLanguageMapping.getSuggestedCountries(
        'en',
      );

      expect(englishCountries, contains('US')); // United States
      expect(englishCountries, contains('GB')); // United Kingdom
      expect(englishCountries, contains('CA')); // Canada
      expect(englishCountries, contains('AU')); // Australia
      expect(englishCountries, isNotEmpty);

      if (kDebugMode) {
        debugPrint(
          'DEBUG: English speaking countries: ${englishCountries.length}',
        );
      }
    });

    test('CountryLanguageMapping returns fallback for unsupported language',
        () {
      final fallbackCountries = CountryLanguageMapping.getSuggestedCountries(
        'xx',
      );

      expect(fallbackCountries, contains('US')); // Should fallback to English
      expect(fallbackCountries, isNotEmpty);

      if (kDebugMode) {
        debugPrint(
          'DEBUG: Fallback countries for unsupported language: ${fallbackCountries.length}',
        );
      }
    });

    testWidgets('CountryPicker shows suggested countries when enabled', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CountryPicker(
              selectedCountry: null,
              onCountrySelected: (country) {},
              showSuggestedCountries: true,
            ),
          ),
        ),
      );

      // Wait for the widget to build
      await tester.pumpAndSettle();

      // Verify that the picker is created successfully
      expect(find.byType(CountryPicker), findsOneWidget);
    });

    testWidgets(
      'CountryPicker works without suggested countries when disabled',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CountryPicker(
                selectedCountry: null,
                onCountrySelected: (country) {},
                showSuggestedCountries: false,
              ),
            ),
          ),
        );

        // Wait for the widget to build
        await tester.pumpAndSettle();

        // Verify that the picker is created successfully
        expect(find.byType(CountryPicker), findsOneWidget);
      },
    );

    testWidgets('CountryPickerBuilder supports showSuggestedCountries', (
      WidgetTester tester,
    ) async {
      final picker = CountryPicker.builder()
          .selectedCountry(null)
          .onCountrySelected((country) {})
          .showSuggestedCountries(true)
          .build();

      await tester.pumpWidget(MaterialApp(home: Scaffold(body: picker)));

      // Wait for the widget to build
      await tester.pumpAndSettle();

      // Verify that the picker is created successfully
      expect(find.byType(CountryPicker), findsOneWidget);
    });

    testWidgets('CountryPickerBuilder can disable suggested countries', (
      WidgetTester tester,
    ) async {
      final picker = CountryPicker.builder()
          .selectedCountry(null)
          .onCountrySelected((country) {})
          .showSuggestedCountries(false)
          .build();

      await tester.pumpWidget(MaterialApp(home: Scaffold(body: picker)));

      // Wait for the widget to build
      await tester.pumpAndSettle();

      // Verify that the picker is created successfully
      expect(find.byType(CountryPicker), findsOneWidget);
    });

    test('Suggested countries are properly organized', () {
      // Test with French locale
      final frenchCountries = CountryLanguageMapping.getSuggestedCountries(
        'fr',
      );
      const allCountries = CountryData.countries;

      // Verify that suggested countries are a subset of all countries
      for (final suggestedCode in frenchCountries) {
        final found = allCountries.any(
          (country) => country.code == suggestedCode,
        );
        expect(
          found,
          isTrue,
          reason:
              'Suggested country $suggestedCode should exist in all countries',
        );
      }

      if (kDebugMode) {
        debugPrint(
          'DEBUG: French suggested countries: ${frenchCountries.length}',
        );
        debugPrint('DEBUG: Total countries: ${allCountries.length}');
      }
    });

    test('All supported languages have suggested countries', () {
      const supportedLanguages = [
        'fr',
        'es',
        'de',
        'it',
        'pt',
        'ru',
        'ar',
        'zh',
        'ja',
        'ko',
        'hi',
        'tr',
        'pl',
        'uk',
        'vi',
        'th',
        'id',
        'nl',
      ];

      for (final language in supportedLanguages) {
        final suggestedCountries = CountryLanguageMapping.getSuggestedCountries(
          language,
        );
        expect(
          suggestedCountries,
          isNotEmpty,
          reason: 'Language $language should have suggested countries',
        );

        if (kDebugMode) {
          debugPrint(
            'DEBUG: Language $language has ${suggestedCountries.length} suggested countries',
          );
        }
      }
    });

    test('Suggested countries are sorted by population in descending order',
        () {
      // Test with Spanish speaking countries
      final spanishCountries = CountryLanguageMapping.getSuggestedCountries(
        'es',
      );

      // Verify that countries are sorted by population (descending)
      // First 5 countries should be: US, MX, PH, CO, ES
      expect(spanishCountries.take(5).toList(), ['US', 'MX', 'PH', 'CO', 'ES']);

      if (kDebugMode) {
        debugPrint(
          'DEBUG: Spanish countries sorted by population: ${spanishCountries.take(5).join(', ')}...',
        );
      }
    });

    test('Suggested countries are properly sorted', () {
      // Test with French speaking countries
      final frenchCountries = CountryLanguageMapping.getSuggestedCountries(
        'fr',
      );

      // Verify that first 5 countries are sorted by population
      // First 5 countries should be: CD, FR, DZ, CA, MA
      expect(frenchCountries.take(5).toList(), ['CD', 'FR', 'DZ', 'CA', 'MA']);

      if (kDebugMode) {
        debugPrint(
          'DEBUG: French countries sorted by population: ${frenchCountries.take(5).join(', ')}...',
        );
      }
    });
  });
}
