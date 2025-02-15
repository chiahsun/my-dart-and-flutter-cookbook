import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Some function usage test', () {
    test('Spread', () {
      final list1 = [0, 1, 2];
      final list2 = [3, 4];
      expect([...list1, ...list2], [0, 1, 2, 3, 4]);
    });
  });
}