import 'package:flutter/material.dart';
import 'package:mayim/Global/Colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backGround,
      child: Image.asset('graphics/mayim_logo.png'),
    );
  }
}