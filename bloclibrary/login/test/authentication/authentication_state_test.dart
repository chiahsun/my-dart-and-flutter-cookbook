import 'package:flutter_test/flutter_test.dart';
import 'package:login/authentication/bloc/authentication_bloc.dart';
import 'package:login/user_repository/models/user.dart';

void main() {
  group('AuthenticationState', () {
    test('supports value comparisons', () {
      expect(
        AuthenticationState.unknown(),
        AuthenticationState.unknown(),
      );
      expect(
        AuthenticationState.unknown(),
        isNot(AuthenticationState.authenticated(User.emptyUser)),
      );

      final User user = User('sample-id');
      expect(
        AuthenticationState.authenticated(user),
        AuthenticationState.authenticated(user),
      );
      expect(
        AuthenticationState.unauthenticated(),
        AuthenticationState.unauthenticated(),
      );
    });
  });
}