
import 'package:counter/counter/view/counter_page.dart';
import 'package:counter/counter/view/counter_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(CounterPage, () {
    testWidgets('Render $CounterView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: CounterPage()));
      expect(find.byType(CounterView), findsOneWidget);
    });
  });
}