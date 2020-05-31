import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  @override
  AuthenticationState get initialState => AuthenticationInitial();

  Future<String> _getToken() => null;

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    yield AuthenticationLoading();
    if (event is AppStarted) {
      try {
        final token = await _getToken();
        yield Authenticated(token: token);
      } catch (error) {
        yield Unauthenticated();
      }
    }
    if (event is LoggedIn) {
      yield Authenticated(token: event.token);
    }
    if (event is LoggedOut) {
      yield Unauthenticated();
    }
  }
}
