import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infinite_list/posts/view/posts_list.dart';
import 'package:infinite_list/posts/view/posts_page.dart';

void main() {
  group('PostsPage', () {
    testWidgets('Render PostsList', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: PostsPage()));
      await tester.pumpAndSettle();
      expect(find.byType(PostsList), findsOneWidget);
    });
  });
}
