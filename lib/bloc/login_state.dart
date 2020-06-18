part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginFailure extends LoginState {
  final String email;
  final String error;

  const LoginFailure({
    @required this.email,
    @required this.error,
  });

  @override
  List<Object> get props => [email, error];

  @override
  String toString() => "LoginFailure { $error }";
}
