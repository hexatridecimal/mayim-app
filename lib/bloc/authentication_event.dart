part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {
  final Repository<AuthorizationToken> tokenRepository;

  AppStarted({@required this.tokenRepository});
}

class LoggedIn extends AuthenticationEvent {
  final AuthorizationToken token;
  const LoggedIn({@required this.token});
  @override
  List<Object> get props => [token];
}

class LoggedOut extends AuthenticationEvent {}

class AuthorizationFailed extends AuthenticationEvent {
  final error;

  AuthorizationFailed({@required this.error});
}
