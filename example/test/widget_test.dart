import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_country_picker_example/main.dart';

void main() {
  testWidgets('renders demo shell', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.textContaining('Country Picker Demo v'), findsOneWidget);
    expect(find.text('Interactive Playground'), findsOneWidget);
    expect(find.text('Builder API Examples:'), findsOneWidget);
    expect(find.text('CountryFlag Showcase'), findsOneWidget);
  });
}
