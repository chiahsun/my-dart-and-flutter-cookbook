

import 'package:flutter_test/flutter_test.dart';
import 'package:login/user_repository/user_repository.dart';
import 'package:uuid/uuid.dart';

void main() {
  group('User repository', () {
    test('supports value comparisons', () async {
      final user = await UserRepository().getUser();
      expect(user, isNotNull);
      expect(Uuid.isValidUUID(fromString: user?.id ?? ''), isTrue);
    });
  });
}