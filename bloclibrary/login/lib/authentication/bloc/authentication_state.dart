part of 'authentication_bloc.dart';


class AuthenticationState extends Equatable {
  
  final AuthenticationStatus status;
  final User user;

  const AuthenticationState._({required this.status, required this.user});

  const AuthenticationState.unknown() : this._(status: AuthenticationStatus.unknown, user: User.emptyUser);

  const AuthenticationState.authenticated(User user) : this._(status: AuthenticationStatus.authenticated, user: user);

  const AuthenticationState.unauthenticated() : this._(status: AuthenticationStatus.unauthenticated, user: User.emptyUser);
  
  @override
  List<Object?> get props => [status, user];
}