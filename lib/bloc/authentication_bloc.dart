import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_data/flutter_data.dart';
import 'package:mayim/data/authorization_token.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  Repository<AuthorizationToken> repository;

  @override
  AuthenticationState get initialState => AuthenticationInitial();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    yield AuthenticationLoading();
    if (event is AppStarted) {
      repository = event.tokenRepository;
      final tokens = await repository.findAll();
      if (tokens.isEmpty) {
        yield Unauthenticated();
      } else {
        yield Authenticated(token: tokens.first);
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
