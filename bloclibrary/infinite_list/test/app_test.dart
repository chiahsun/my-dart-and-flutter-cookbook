import 'package:flutter_test/flutter_test.dart';
import 'package:infinite_list/app.dart';
import 'package:infinite_list/posts/view/posts_page.dart';

void main() {
  group('Some function usage test', () {
    test('Spread', () {
      final list1 = [0, 1, 2];
      final list2 = [3, 4];
      expect([...list1, ...list2], [0, 1, 2, 3, 4]);
    });
  });

  group('App', () {
    testWidgets('Renders PostsPage', (tester) async {
      await tester.pumpWidget(App());
      await tester.pumpAndSettle();
      expect(find.byType(PostsPage), findsOneWidget);
    });
  });
}