
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mayim/Global/Colors.dart';
import 'package:mayim/bloc/login_bloc.dart';
import 'package:provider/provider.dart';

import 'Login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Container(
          decoration: bgGradient,
          child: ListView(
            children: <Widget>[
              LoginPageHeader(),
              BlocProvider<LoginBloc>(
                  create: (context) => LoginBloc(repository: context.read()),
                  child: LoginPageBlocBuilder()),
            ],
          )),
    );
  }
}

class LoginPageBlocBuilder extends StatelessWidget {
  const LoginPageBlocBuilder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      bloc: context.watch(),
      builder: (context, state) {
        // ignore: close_sinks
        if (state is LoginLoading) {
          return Center(child: CircularProgressIndicator());
        }
        return Provider<LoginState>(
          create: (context) => state,
          child: LoginPageForm(),
        );
      },
    );
  }
}
