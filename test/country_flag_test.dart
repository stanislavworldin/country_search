import 'package:country_search/country_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CountryFlag lookups', () {
    test('lookupByLanguageCode resolves by language', () {
      final country = CountryFlag.lookupByLanguageCode('ur');
      expect(country, isNotNull);
      expect(country!.code, equals('PK'));
    });

    test('lookupByLanguageCode resolves region override', () {
      final country = CountryFlag.lookupByLanguageCode('pt-BR');
      expect(country, isNotNull);
      expect(country!.code, equals('BR'));
    });

    test('lookupByCurrencyCode resolves country', () {
      final country = CountryFlag.lookupByCurrencyCode('usd');
      expect(country, isNotNull);
      expect(country!.code, equals('US'));
    });

    test('lookupByPhoneCode resolves country', () {
      final country = CountryFlag.lookupByPhoneCode('44');
      expect(country, isNotNull);
      expect(country!.code, equals('GB'));
    });

    test('lookupByCurrencyCode returns null for unknown', () {
      final country = CountryFlag.lookupByCurrencyCode('zzz');
      expect(country, isNull);
    });
  });

  group('CountryFlag widget', () {
    testWidgets('emoji mode renders emoji flag', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CountryFlag.fromCountryCode('US'),
          ),
        ),
      );

      expect(find.text('🇺🇸'), findsOneWidget);
    });

    testWidgets('svg mode uses custom svg builder',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CountryFlag.fromCountryCode(
              'US',
              mode: CountryFlagMode.svg,
              svgBuilder: (context, svgUrl, country, style, fallback) {
                return const Text('SVG_FLAG_WIDGET');
              },
            ),
          ),
        ),
      );

      expect(find.text('SVG_FLAG_WIDGET'), findsOneWidget);
    });

    testWidgets('svg mode falls back to emoji when svg builder throws', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CountryFlag.fromCountryCode(
              'US',
              mode: CountryFlagMode.svg,
              svgBuilder: (context, svgUrl, country, style, fallback) {
                throw StateError('svg failed');
              },
            ),
          ),
        ),
      );

      expect(find.text('🇺🇸'), findsOneWidget);
    });

    testWidgets('fromPhoneCode resolves and renders flag', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CountryFlag.fromPhoneCode('81'),
          ),
        ),
      );

      expect(find.text('🇯🇵'), findsOneWidget);
    });

    testWidgets('style with circle wraps in ClipOval',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CountryFlag.fromCountryCode(
              'DE',
              style: const CountryFlagStyle(isCircle: true),
            ),
          ),
        ),
      );

      expect(find.byType(ClipOval), findsOneWidget);
    });
  });
}
