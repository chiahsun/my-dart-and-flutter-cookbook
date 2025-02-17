import 'package:flutter_test/flutter_test.dart';
import 'package:login/authentication_repository/authentication_repository.dart';

void main() {
  group('AuthenticationRepository', () {
    late AuthenticationRepository authenticationRepository;

    setUp(() {
      authenticationRepository = AuthenticationRepository();
    });

    test('initial state is unknown', () async {
      expectLater(
          authenticationRepository.status,
          emitsInOrder(
              <AuthenticationStatus>[AuthenticationStatus.unauthenticated]));
    });

    test('logIn emits authenticated', () async {
      expectLater(
          authenticationRepository.status,
          emitsInOrder(<AuthenticationStatus>[
            AuthenticationStatus.unauthenticated,
            AuthenticationStatus.authenticated
          ]));
      await authenticationRepository.logIn(
          username: 'username', password: 'password');
    });

    test('logOut emits unauthenticated', () async {
      expectLater(
          authenticationRepository.status,
          emitsInOrder(<AuthenticationStatus>[
            AuthenticationStatus.unauthenticated,
            AuthenticationStatus.authenticated,
            AuthenticationStatus.unauthenticated
          ]));
      await authenticationRepository.logIn(
          username: 'username', password: 'password');
      authenticationRepository.logOut();
    });
  });
}
