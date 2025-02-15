import 'package:flutter_test/flutter_test.dart';
import 'package:timer/app.dart';
import 'package:timer/timer/view/timer_page.dart';

void main() {
  group('App', () {
    testWidgets('Render TimerPage', (tester) async {
      await tester.pumpWidget(App());
      expect(find.byType(TimerPage), findsOneWidget);
    });

    test('Test spreading switch', () {
      expect(
          ([
            ...switch (1) {
              1 => [1],
              _ => [2, 3],
            }
          ]),
          [1]);

      expect(
          ([
            ...switch (3) {
              1 => [1],
              _ => [2, 3],
            }
          ]),
          [2, 3]);
    });
  });
}
