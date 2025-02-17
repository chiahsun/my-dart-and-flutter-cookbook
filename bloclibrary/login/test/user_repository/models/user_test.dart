import 'package:flutter_test/flutter_test.dart';
import 'package:login/user_repository/models/user.dart';

void main() {
  group('User', () {
    test('supports value comparisons', () {
      expect(User('1'), User('1'));
    });
  });
}