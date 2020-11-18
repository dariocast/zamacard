part of 'authentication_bloc.dart';

enum AuthenticationStatus { authenticated, unauthenticated, unknown }

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final User user;
  const AuthenticationState({
    this.status = AuthenticationStatus.unknown,
    this.user = User.empty,
  });

  @override
  List<Object> get props => [status, user];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  const AuthenticationAuthenticated(User user)
      : super(status: AuthenticationStatus.authenticated, user: user);
}

class AuthenticationUnauthenticated extends AuthenticationState {
  const AuthenticationUnauthenticated()
      : super(status: AuthenticationStatus.unauthenticated);
}
