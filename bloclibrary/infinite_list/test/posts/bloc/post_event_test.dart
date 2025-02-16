import 'package:flutter_test/flutter_test.dart';
import 'package:infinite_list/posts/bloc/post_bloc.dart';

void main() {
  group('PostEvent', () {
    test('supports value comparisons', () {
      expect(FetchPost(), FetchPost());
    });
  });
}