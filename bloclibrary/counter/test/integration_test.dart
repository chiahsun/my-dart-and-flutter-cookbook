import 'package:counter/counter/keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:counter/main.dart' as app;

extension on WidgetTester {
  Future<void> pumpApp() async {
    app.main();

    await pumpAndSettle();
  }

  Future<void> tapIncrement() async {
    await tap(find.byKey(keyIncrement));
    await pump();
  }

  Future<void> tapDecrement() async {
    await tap(find.byKey(keyDecrement));
    await pump();
  }
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('CounterApp', () {
    testWidgets('Render correct AppBar text', (tester) async {
      await tester.pumpApp();

      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('Test tap increment/decrement', (tester) async {
      await tester.pumpApp();

      await tester.tapIncrement();
      expect(find.text('1'), findsOneWidget);

      await tester.tapIncrement();
      expect(find.text('2'), findsOneWidget);

      await tester.tapDecrement();
      expect(find.text('1'), findsOneWidget);

      await tester.tapDecrement();
      expect(find.text('0'), findsOneWidget);

      await tester.tapDecrement();
      expect(find.text('-1'), findsOneWidget);
    });
  });
}
