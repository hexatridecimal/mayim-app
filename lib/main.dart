import 'dart:convert';

import 'package:mayim/src/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mayim Chat",
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      theme: ThemeData(
        accentColor: Colors.white70
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List online;
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
    getOnlineUsers();
  }

  getOnlineUsers() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") != null) {
      var response = await http.get(
          Uri.encodeFull("http://192.168.1.15:3000/online"),
          headers: {
            "Accept": "application/json",
            "Authorization": sharedPreferences.getString("token")
          }
      );

      this.setState(() {
        online = json.decode(response.body);
      });

      print(online[1]["name"]);
    }
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Surgery Revolution", style: TextStyle(color: Colors.white)),
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
      body: new ListView.builder(
        itemCount: online == null ? 0 : online.length,
        itemBuilder: (BuildContext context, int index){
          return new Card(
            child: new Text(online[index]["name"]),
          );
        },
      ),
      drawer: Drawer(
        child: new ListView(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  accountName: new Text('Janet Braswell-Jeffus'),
                  accountEmail: new Text('janet@surgeryrevolution.com'),
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
    );
  }
}
