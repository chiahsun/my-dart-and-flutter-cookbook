import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login/authentication/bloc/authentication_bloc.dart';
import 'package:login/authentication_repository/authentication_repository.dart';
import 'package:login/user_repository/models/user.dart';
import 'package:login/user_repository/user_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late AuthenticationRepository authenticationRepository;
  late UserRepository userRepository;
  late AuthenticationBloc bloc;

  const user = User('some user id');
  const error = 'oops';

  setUp(() {
    authenticationRepository = MockAuthenticationRepository();
    userRepository = MockUserRepository();
    bloc = AuthenticationBloc(
      authenticationRepository: authenticationRepository,
      userRepository: userRepository,
    );
  });

  group('AuthenticationBloc', () {
    test('Initial state is unknown', () {
      expect(bloc.state, const AuthenticationState.unknown());
    });
    // bloc.close();
  });

  group('AuthenticationSubscriptionRequested', () {
    blocTest<AuthenticationBloc, AuthenticationState>(
      'Emit [unknown] when status is unknown',
      build: () {
        when(() => authenticationRepository.status)
            .thenAnswer((_) => Stream.value(AuthenticationStatus.unknown));
        return bloc;
      },
      act: (bloc) => bloc.add(const AuthenticationSubscriptionRequested()),
      expect: () => const <AuthenticationState>[AuthenticationState.unknown()],
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'Emit [unauthenticated] when status is unauthenticated',
      build: () {
        when(() => authenticationRepository.status).thenAnswer(
            (_) => Stream.value(AuthenticationStatus.unauthenticated));
        return bloc;
      },
      act: (bloc) => bloc.add(const AuthenticationSubscriptionRequested()),
      expect: () =>
          const <AuthenticationState>[AuthenticationState.unauthenticated()],
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'Emit [authenticated] when status is authenticated',
      build: () {
        when(() => authenticationRepository.status).thenAnswer(
            (_) => Stream.value(AuthenticationStatus.authenticated));
        when(() => userRepository.getUser()).thenAnswer((_) async => user);
        return bloc;
      },
      act: (bloc) => bloc.add(const AuthenticationSubscriptionRequested()),
      expect: () =>
          const <AuthenticationState>[AuthenticationState.authenticated(user)],
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'Emit [unauthenticated] when status is authenticated but user is null',
      build: () {
        when(() => authenticationRepository.status).thenAnswer(
            (_) => Stream.value(AuthenticationStatus.authenticated));
        when(() => userRepository.getUser()).thenAnswer((_) async => null);
        return bloc;
      },
      act: (bloc) => bloc.add(const AuthenticationSubscriptionRequested()),
      expect: () =>
          const <AuthenticationState>[AuthenticationState.unauthenticated()],
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'Add error when status stream emits an error',
      setUp: () {
        when(() => authenticationRepository.status)
            .thenAnswer((_) => Stream.error(error));
      },
      build: () => AuthenticationBloc( // We cannot use late bloc here so we need to recreate the bloc; otherwise, we will not get an error
        authenticationRepository: authenticationRepository,
        userRepository: userRepository,
      ),
      act: (bloc) => bloc.add(const AuthenticationSubscriptionRequested()),
      errors: () => [error],
    );


  });

  // https://pub.dev/packages/bloc_test
  // https://pub.dev/packages/mocktail
  group('AuthenticationLogoutPressed', () {
    blocTest<AuthenticationBloc, AuthenticationState>(
      'Emit [unauthorized] when logout',
      setUp: () {
        when(() => authenticationRepository.status)
           .thenAnswer((_) => Stream.value(AuthenticationStatus.unauthenticated));
      },
      build: () => bloc,
      seed: () => AuthenticationState.authenticated(user),
      act: (bloc) { 
        bloc.add(const AuthenticationSubscriptionRequested()); // Register stream
        bloc.add(const AuthenticationLogoutPressed());
      },
      // wait: const Duration(seconds: 2),
      verify: (_) => verify(() => authenticationRepository.logOut()).called(1),
      expect: () => const <AuthenticationState>[AuthenticationState.unauthenticated()],
    );
  });

}
