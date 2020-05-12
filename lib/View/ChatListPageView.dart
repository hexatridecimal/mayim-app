import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mayim/Global/Colors.dart' as myColors;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'package:mayim/View/Login.dart';
import 'package:mayim/View/Call.dart';
import 'package:mayim/Widget/ChatListViewItem.dart';
import 'package:mayim/Widget/Loading.dart';

class ChatListPageView extends StatefulWidget {
  @override
  _ChatListPageViewState createState() => _ChatListPageViewState();
}

class _ChatListPageViewState extends State<ChatListPageView> {
  bool isLoading = true;
  List online;
  var userProfile = null;
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
    getOnlineUsers();

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  getOnlineUsers() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") != null && sharedPreferences.getString("user") != null) {
      userProfile = json.decode(sharedPreferences.getString("user"));
      var response = await http.get(
          Uri.encodeFull("http://192.168.1.28:3000/api/v1/users"),
          headers: {
            "Accept": "application/json",
            "Authorization": sharedPreferences.getString("token")
          }
      );

      this.setState(() {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        print('Response authorization: ${response.headers['authorization']}');
        online = json.decode(response.body);
      });
    }
  }

  Future<void> onJoin() async {
    // update input validation
    /* setState(() {
      _channelController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });
    if (_channelController.text.isNotEmpty) {
      // await for camera and mic permissions before pushing video page
      await _handleCameraAndMic();
      // push video page with given channel name
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(
            channelName: _channelController.text,
          ),
        ),
      );
    } */
  }

  Future<void> _handleCameraAndMic() async {
    await PermissionHandler().requestPermissions(
      [PermissionGroup.camera, PermissionGroup.microphone],
    );
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading == true) {
      return Loading();
    } else {
      return Container(
        child: Scaffold(
          backgroundColor: myColors.blue,
          appBar: AppBar(
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            centerTitle: true,
            title: Text("Mayim Chat", style: TextStyle(color: Colors.white)),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  sharedPreferences.clear();
                  sharedPreferences.commit();
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
                },
                child: Text("Log Out", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          body: Container(
            child: Container(
              decoration: BoxDecoration(
                  color: myColors.backGround,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  )),
              child: new ListView.builder(
                itemCount: online == null ? 0 : online.length,
                itemBuilder: (BuildContext context, int index){
                  return new ChatListViewItem(
                      hasUnreadMessage: true,
                      image: AssetImage('assets/images/person1.jpg'),
                      lastMessage:
                          "Lorem ipsum dolor sit amet. Sed pharetra ante a blandit ultrices.",
                      name: online[index]["name"],
                      newMesssageCount: 8,
                      time: online[index]["last_login"],
                      );
                },
              ),
            ),
          ),
          drawer: Drawer(
            child: new ListView(
                  children: <Widget>[
                    new UserAccountsDrawerHeader(
                      accountName: new Text('Janet Braswell-Jeffus'),
                      accountEmail: new Text('janet@may-im.com'),
                      // decoration: new BoxDecoration(
                      //   image: new DecorationImage(
                      //     fit: BoxFit.fill,
                      //    // image: AssetImage('img/estiramiento.jpg'),
                      //   )
                      // ),
                    ),
                    new Divider(),
                    // new ListTile(
                    //   title: new Text("Add data"),
                    //   trailing: new Icon(Icons.fitness_center),
                    //   onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    //     builder: (BuildContext context) => AddData(),
                    //   )),
                    // ),
                    // new Divider(),
                    // new ListTile(
                    //   title: new Text("Mostrar listado"),
                    //   trailing: new Icon(Icons.help),
                    //   onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    //     builder: (BuildContext context) => ShowData(),
                    //   )),
                    // ),
                  ],
                ),
          ),
        ),
      );
    }
  }
}

