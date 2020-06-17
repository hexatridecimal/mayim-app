import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_data/flutter_data.dart';
import 'package:mayim/data/authorization_token.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Repository<AuthorizationToken> repository;

  LoginBloc({@required this.repository}) : super();

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
        await (repository as AuthenticationAdapter)
            .login(email: event.email, password: event.password);
        yield LoginInitial();
      } on SocketException catch (_) {
        yield LoginFailure(error: "Login failed: Connection failure");
      }
    }
  }
}
