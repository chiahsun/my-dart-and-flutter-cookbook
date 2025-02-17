import 'dart:async';

enum AutheticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AutheticationStatus>();

  Stream<AutheticationStatus> get status async* {
    await Future.delayed(Duration(seconds: 1));
    yield AutheticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({required String username, required String password}) async {
    await Future.delayed(Duration(seconds: 1));
    _controller.add(AutheticationStatus.authenticated);
  }

  void logOut() {
    _controller.add(AutheticationStatus.unauthenticated);
  }

  void dispose() {
    _controller.close();
  }
}