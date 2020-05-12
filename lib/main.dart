import 'package:flutter/material.dart';
import 'package:mayim/src/pages/login.dart';
import 'package:mayim/Global/Colors.dart' as myColors;
import 'package:mayim/View/ChatListPageView.dart';

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
      home: ChatListPageView(),
    );
  }
}

