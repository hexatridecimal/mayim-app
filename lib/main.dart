import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mayim/Global/Colors.dart' as myColors;
import 'package:mayim/View/Login.dart';
import 'package:mayim/View/ChatListPageView.dart';
import 'package:mayim/View/Splash.dart';
import 'package:mayim/bloc/authentication_bloc.dart';
import 'package:mayim/main.data.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() {
  BlocSupervisor.delegate = SimpleDelegate();
  runApp(MultiProvider(
    providers: [
      BlocProvider(
        create: (context) => AuthenticationBloc()..add(AppStarted()),
      ),
      ...dataProviders(() => getApplicationDocumentsDirectory(), clear: true),
    ],
    child: MyApp(),
  ));
}

class SimpleDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Mayim Chat',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: myColors.blue,
        ),
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is Unauthenticated) {
              return LoginPage();
            }
            if (state is Authenticated) {
              return ChatListPageView();
            }
            return SplashPage();
          },
        ));
  }
}
