import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
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
