part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}
class Authenticated extends AuthenticationState {
  final AuthorizationToken token;
  const Authenticated({@required this.token});
  @override
  List<Object> get props => [token];
}
class Unauthenticated extends AuthenticationState {}
class AuthenticationLoading extends AuthenticationState {}
