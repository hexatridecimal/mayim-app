import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mayim/Global/Colors.dart' as myColors;
import 'package:mayim/Screens/SignUp_screen.dart';
import 'package:mayim/Utils/Constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'package:mayim/Settings.dart';
import 'package:mayim/View/Login.dart';
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
      // setState(() {
        isLoading = false;
      // });
    });
  }

  signOut() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") != null) {
      userProfile = json.decode(sharedPreferences.getString("user"));
      var response = await http.delete(
          Uri.encodeFull(APP_SERVER + "/logout"),
          headers: {
            "Accept": "application/json",
            "Authorization": sharedPreferences.getString("token")
          }
      );

      this.setState(() {
        print('Logout');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        sharedPreferences.clear();
        sharedPreferences.commit();
      });
    }
  }

  getOnlineUsers() async {
    sharedPreferences = await SharedPreferences.getInstance();
    print('Token is ${sharedPreferences.getString("token")}');
    if(sharedPreferences.getString("token") != null && sharedPreferences.getString("user") != null) {
      userProfile = json.decode(sharedPreferences.getString("user"));
      var response = await http.get(
          Uri.encodeFull(APP_SERVER + "/api/v1/users"),
          headers: {
            "Accept": "application/json",
            "Authorization": sharedPreferences.getString("token")
          }
      );
      print('New flutter');
      this.setState(() {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        print('Response authorization: ${response.headers['authorization']}');
        if (response.statusCode == 401) {
          sharedPreferences.remove('token');
          sharedPreferences.remove('conversation');
          sharedPreferences.remove('receiver_id');
          sharedPreferences.remove('user');
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
        } else {
          online = json.decode(response.body);
        }
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
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => SignupScreen()), (Route<dynamic> route) => false);
    }
    Constant.token = sharedPreferences.getString("token");
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
                  signOut();
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
                      hasUnreadMessage: false,
                      image: new NetworkImage(APP_SERVER + online[index]["avatar_url"]),
                      lastMessage:
                          "Lorem ipsum dolor sit amet. Sed pharetra ante a blandit ultrices.",
                      name: online[index]["name"],
                      id: online[index]["id"],
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
                      accountName: new Text(userProfile["name"]),
                      accountEmail: new Text(userProfile["email"]),
                      currentAccountPicture: new CircleAvatar(
                        backgroundImage: new NetworkImage(APP_SERVER + userProfile["avatar_url"]),
                      )
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

