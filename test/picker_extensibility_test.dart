import 'package:country_search/country_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

const _localizationDelegates = [
  CountryLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];

void main() {
  group('CountryPicker extensibility', () {
    testWidgets('itemBuilder is invoked for rendered countries', (
      WidgetTester tester,
    ) async {
      final renderedCodes = <String>{};

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: _localizationDelegates,
          supportedLocales: const [Locale('en')],
          home: Scaffold(
            body: CountryPicker.builder()
                .selectedCountry(null)
                .onCountrySelected((country) {})
                .showSuggestedCountries(false)
                .countryFilter(
                  (country) => country.code == 'US' || country.code == 'UA',
                )
                .itemBuilder(
                    (context, country, isSelected, onSelect, defaultItem) {
              renderedCodes.add(country.code);
              return defaultItem;
            }).build(),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.arrow_drop_down).first);
      await tester.pumpAndSettle();

      expect(renderedCodes, contains('US'));
      expect(renderedCodes, contains('UA'));
    });

    testWidgets('emptySearchBuilder is shown when no search results', (
      WidgetTester tester,
    ) async {
      var queryFromBuilder = '';

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: _localizationDelegates,
          supportedLocales: const [Locale('en')],
          home: Scaffold(
            body: CountryPicker.builder()
                .selectedCountry(null)
                .onCountrySelected((country) {})
                .showSuggestedCountries(false)
                .countryFilter((country) => country.code == 'US')
                .emptySearchBuilder((context, query) {
              queryFromBuilder = query;
              return const Center(child: Text('EMPTY_STATE'));
            }).build(),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.arrow_drop_down).first);
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'zzzzzz');
      await tester.pumpAndSettle();

      expect(find.text('EMPTY_STATE'), findsOneWidget);
      expect(queryFromBuilder, equals('zzzzzz'));
    });

    testWidgets('modalHeaderBuilder wraps default header', (
      WidgetTester tester,
    ) async {
      var headerBuilt = false;

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: _localizationDelegates,
          supportedLocales: const [Locale('en')],
          home: Scaffold(
            body: CountryPicker.builder()
                .selectedCountry(null)
                .onCountrySelected((country) {})
                .modalHeaderBuilder((context, defaultHeader) {
              headerBuilt = true;
              return defaultHeader;
            }).build(),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.arrow_drop_down).first);
      await tester.pumpAndSettle();

      expect(headerBuilt, isTrue);
    });

    testWidgets('search is accent-insensitive for localized names', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          locale: const Locale('fr'),
          localizationsDelegates: _localizationDelegates,
          supportedLocales: const [Locale('fr')],
          home: Scaffold(
            body: CountryPicker.builder()
                .selectedCountry(null)
                .onCountrySelected((country) {})
                .showSuggestedCountries(false)
                .countryFilter((country) => country.code == 'US')
                .build(),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.arrow_drop_down).first);
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'etats');
      await tester.pumpAndSettle();

      expect(find.text('États-Unis'), findsOneWidget);
    });

    testWidgets('search normalizes phone input with symbols', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: _localizationDelegates,
          supportedLocales: const [Locale('en')],
          home: Scaffold(
            body: CountryPicker.builder()
                .selectedCountry(null)
                .onCountrySelected((country) {})
                .showSuggestedCountries(false)
                .countryFilter((country) => country.code == 'US')
                .build(),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.arrow_drop_down).first);
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), '(+1)');
      await tester.pumpAndSettle();

      expect(find.text('United States'), findsOneWidget);
    });
  });

  group('CountryPicker builder modal controls', () {
    test('builder configures modal controls', () {
      final picker = CountryPicker.builder()
          .onCountrySelected((country) {})
          .useRootNavigator(true)
          .bottomSheetWidth(520)
          .moveAlongWithKeyboard(true)
          .build();

      expect(picker.useRootNavigator, isTrue);
      expect(picker.bottomSheetWidth, equals(520));
      expect(picker.moveAlongWithKeyboard, isTrue);
    });
  });
}
