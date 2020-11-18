part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationEventUserChanged extends AuthenticationEvent {
  const AuthenticationEventUserChanged(this.user);

  final User user;

  @override
  List<Object> get props => [user];
}

class AuthenticationEventLogoutRequested extends AuthenticationEvent {}
