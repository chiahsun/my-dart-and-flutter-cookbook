import 'package:counter/counter/view/counter_page.dart';
import 'package:counter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(CounterApp, () {
    testWidgets('is a $MaterialApp', (tester) async {
      expect(CounterApp(), isA<MaterialApp>());
    });
    testWidgets('Home is a $CounterPage', (tester) async {
      expect(CounterApp().home, isA<CounterPage>());
    });

    testWidgets('Render $CounterPage', (tester) async {
      await tester.pumpWidget(CounterApp());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
