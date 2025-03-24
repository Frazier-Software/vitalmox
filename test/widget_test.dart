// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vitalmox/src/app.dart';

import 'test_config.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      VitalMox(config: testConfig),
    );

    // should start with two players at 20 health
    expect(find.text('20'), findsNWidgets(2));

    // tap to increment
    await tester.tap(find.byType(InkWell).first);
    await tester.pump();
    expect(find.text('21'), findsOne);

    // tap to decrement
    await tester.tap(find.byType(InkWell).at(3));
    await tester.pump();
    expect(find.text('19'), findsOne);
  });
}
