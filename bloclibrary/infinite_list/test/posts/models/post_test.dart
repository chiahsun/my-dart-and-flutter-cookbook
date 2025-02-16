import 'package:flutter_test/flutter_test.dart';
import 'package:infinite_list/posts/models/post.dart';

void main() {
  group('Post should support comparison', () {
    test('Two posts with the same properties should be equal', () {
      final post1 = Post(id: 1, title: 'title', body: 'body');
      final post2 = Post(id: 1, title: 'title', body: 'body');
      expect(post1, post2);
    });

    test('Two posts with different properties should not be equal', () {
      final post1 = Post(id: 1, title: 'title', body: 'body');
      final post2 = Post(id: 2, title: 'title', body: 'body');
      expect(post1, isNot(post2));
    });
  });
}