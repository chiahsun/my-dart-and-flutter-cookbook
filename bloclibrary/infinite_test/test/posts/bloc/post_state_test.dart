import 'package:flutter_test/flutter_test.dart';
import 'package:infinite_test/posts/bloc/post_bloc.dart';

void main() {
  group('Post state should support value comparison', () {
    test('Support value comparison', () {
      expect(PostState(), PostState());
    });
  });
}