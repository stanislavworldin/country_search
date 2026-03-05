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

Widget _buildHost(CountryPicker picker) {
  return MaterialApp(
    localizationsDelegates: _localizationDelegates,
    supportedLocales: CountryLocalizations.supportedLocales,
    home: Scaffold(body: picker),
  );
}

void main() {
  group('CountryPicker modal behavior', () {
    testWidgets('bottomSheetWidth applies max width constraint', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        _buildHost(
          CountryPicker.builder()
              .onCountrySelected((country) {})
              .bottomSheetWidth(432)
              .build(),
        ),
      );

      await tester.tap(find.byIcon(Icons.arrow_drop_down).first);
      await tester.pumpAndSettle();

      final constrainedBoxes = tester.widgetList<ConstrainedBox>(
        find.byType(ConstrainedBox),
      );

      final hasTargetMaxWidth = constrainedBoxes.any((box) {
        final maxWidth = box.constraints.maxWidth;
        return maxWidth.isFinite && (maxWidth - 432).abs() < 0.01;
      });

      expect(hasTargetMaxWidth, isTrue);
    });

    testWidgets(
        'moveAlongWithKeyboard enables keyboard wrapper in bottom sheet', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        _buildHost(
          CountryPicker.builder()
              .onCountrySelected((country) {})
              .moveAlongWithKeyboard(true)
              .build(),
        ),
      );

      await tester.tap(find.byIcon(Icons.arrow_drop_down).first);
      await tester.pumpAndSettle();

      expect(_hasCustomKeyboardAnimatedPadding(tester), isTrue);
    });

    testWidgets('moveAlongWithKeyboard enables keyboard wrapper in dialog mode',
        (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        _buildHost(
          CountryPicker.builder()
              .onCountrySelected((country) {})
              .modalPresentation(CountryPickerModalPresentation.dialog)
              .moveAlongWithKeyboard(true)
              .build(),
        ),
      );

      await tester.tap(find.byIcon(Icons.arrow_drop_down).first);
      await tester.pumpAndSettle();

      expect(_hasCustomKeyboardAnimatedPadding(tester), isTrue);
    });
  });
}

bool _hasCustomKeyboardAnimatedPadding(WidgetTester tester) {
  return tester.widgetList<AnimatedPadding>(find.byType(AnimatedPadding)).any((
    widget,
  ) {
    return widget.duration == const Duration(milliseconds: 160) &&
        widget.curve == Curves.easeOut;
  });
}
