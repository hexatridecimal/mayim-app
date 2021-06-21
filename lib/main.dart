import 'package:flutter/material.dart';
import 'package:mayim/Global/Colors.dart' as myColors;
import 'package:mayim/View/ChatListPageView.dart';

import 'Example.dart';
import 'Screens/SignUp_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mayim Chat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: myColors.blue,
      ),
      home: SignupScreen(),
      // home: ChatListPageView(),
    );
  }
}

