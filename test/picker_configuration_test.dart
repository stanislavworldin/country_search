import 'package:country_search/country_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CountryPicker configuration', () {
    testWidgets('favorites are rendered before regular countries', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [CountryLocalizations.delegate],
          supportedLocales: const [Locale('en')],
          home: Scaffold(
            body: CountryPicker.builder()
                .selectedCountry(null)
                .onCountrySelected((country) {})
                .showSuggestedCountries(false)
                .favorites(const ['UA'])
                .countryFilter(
                  (country) => country.code == 'UA' || country.code == 'US',
                )
                .build(),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.arrow_drop_down).first);
      await tester.pumpAndSettle();

      expect(find.text('Ukraine'), findsOneWidget);
      expect(find.text('United States'), findsOneWidget);

      final ukraineY = tester.getTopLeft(find.text('Ukraine')).dy;
      final usY = tester.getTopLeft(find.text('United States')).dy;
      expect(ukraineY, lessThan(usY));
    });

    testWidgets('exclude removes countries from picker data source', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [CountryLocalizations.delegate],
          supportedLocales: const [Locale('en')],
          home: Scaffold(
            body: CountryPicker.builder()
                .selectedCountry(null)
                .onCountrySelected((country) {})
                .showSuggestedCountries(false)
                .exclude(const ['US'])
                .countryFilter(
                  (country) => country.code == 'UA' || country.code == 'US',
                )
                .build(),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.arrow_drop_down).first);
      await tester.pumpAndSettle();

      expect(find.text('Ukraine'), findsOneWidget);
      expect(find.text('United States'), findsNothing);
    });

    testWidgets('onOpened, onClosed, and onSearchChanged callbacks are fired', (
      WidgetTester tester,
    ) async {
      var opened = false;
      var closed = false;
      final searchQueries = <String>[];

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [CountryLocalizations.delegate],
          supportedLocales: const [Locale('en')],
          home: Scaffold(
            body: CountryPicker.builder()
                .selectedCountry(null)
                .onCountrySelected((country) {})
                .onOpened(() {
              opened = true;
            }).onClosed(() {
              closed = true;
            }).onSearchChanged((query) {
              searchQueries.add(query);
            }).build(),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.arrow_drop_down).first);
      await tester.pumpAndSettle();
      expect(opened, isTrue);

      await tester.enterText(find.byType(TextField), 'uk');
      await tester.pumpAndSettle();
      expect(searchQueries, contains('uk'));

      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();
      expect(closed, isTrue);
    });
  });
}
