import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:mayim/Global/Colors.dart' as myColors;
import 'package:mayim/Widget/ReceivedMessageWidget.dart';
import 'package:mayim/Widget/SendedMessageWidget.dart';
import 'package:mayim/View/CallPage.dart';
import 'package:http/http.dart' as http;
import 'package:mayim/Settings.dart';
import 'dart:convert';
import 'dart:async';

class ChatPageView extends StatefulWidget {

  const ChatPageView({
    Key key,
    //this.conversation,
    //this.name,
    //this.receiver_id,
    //this.receiver_name,
    //this.my_id
  }) : super(key: key);

  @override
  _ChatPageViewState createState() => _ChatPageViewState();
}

class _ChatPageViewState extends State<ChatPageView> {
  String conversation;
  String name;
  String receiver_id;
  String receiver_name;
  String my_id;
  SharedPreferences sharedPreferences;

  TextEditingController _text = new TextEditingController();
  ScrollController _scrollController = ScrollController();
  var childList = <Widget>[];

  void loadMessages() async {
    var jsonResponse = null;
    var headers = {
      "Accept": "application/json",
      "Authorization": sharedPreferences.getString("token")
    };
    print("headers: ${headers}");

    var response = await http.get(APP_SERVER + "/api/v1/messages?conversation="+conversation, headers: headers);
    if(response.statusCode == 200) {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      jsonResponse = json.decode(response.body);
      for ( var message in jsonResponse ) {
        print("message: ${message}");
        print("message['user_id']: ${message['user_id']}: my_id: ${my_id}");
        if (message['user_id'].toString() == my_id) {
          childList.add(Align(
                alignment: Alignment(1, 0),
                child: new SendedMessageWidget(
                  key: Key(message['id'].toString()+message['created_at']),
                  content: message['text'],
                  time: '21:36 PM',
                  ),
          ));
        } else {
          childList.add(Align(
            alignment: Alignment(-1, 0),
            child: new ReceivedMessageWidget(
              content: message['text'],
              time: '22:40 PM',
              key: Key(message['id'].toString()+message['created_at']),
            ),
          ));
        }
        Timer(Duration(milliseconds: 100), () {
          _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 750),
              );
        });
      }
    } else {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }


  @override
  void loadPrefs() async {
    sharedPreferences = await SharedPreferences.getInstance();
    conversation = sharedPreferences.getString("conversation");
    my_id = sharedPreferences.getString("my_id");
    receiver_id = sharedPreferences.getString("receiver_id");
    receiver_name = sharedPreferences.getString("receiver_name");
  }

  @override
  void initState() {
    super.initState();
    loadPrefs();
    loadMessages();
  }

  Future<void> _handleCameraAndMic() async {
    await PermissionHandler().requestPermissions(
        [PermissionGroup.camera, PermissionGroup.microphone],
        );
  }

  Future<void> placeCall(String conversation) async {
    setState(() {
    });
    await _handleCameraAndMic();
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CallPage(
          channelName: conversation,
        ),
      ),
    );
  }

  void _scrollToEnd() {
    if (!_scrollController.hasClients) {
      return;
    }

    var scrollPosition = _scrollController.position;

    if (scrollPosition.maxScrollExtent > scrollPosition.minScrollExtent) {
      _scrollController.animateTo(
          scrollPosition.maxScrollExtent,
          duration: new Duration(milliseconds: 200),
          curve: Curves.easeOut,
          );
    }
  }

  postMessage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var conversation = sharedPreferences.getString("conversation");
    var receiver_id = sharedPreferences.getString("receiver_id");
    Map data = {
      'message[conversation]': conversation,
      'message[receiver_id]': receiver_id,
      'message[text]':  _text.text
    };
    var jsonResponse = null;
    var headers = {
      "Accept": "application/json",
      "Authorization": sharedPreferences.getString("token")
    };
    print("data: ${data}");
    print("headers: ${headers}");

    var response = await http.post(APP_SERVER + "/api/v1/messages", headers: headers, body: data);
    if(response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
    else {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }

  void sendMessage() async {
    setState(() {
    });
    DateTime now = new DateTime.now();
    String formatted ="${now.hour.toString()}:${now.minute.toString().padLeft(2,'0')}:${now.second.toString().padLeft(2,'0')}";
    print("time: ${formatted}");
    var say = _text.text;
    print("say: ${say}");
    childList.add(Align(
      alignment: Alignment(1, 0),
      child: SendedMessageWidget(
        content: say,
        time: formatted,
      ),
    ));
    _scrollToEnd();
    postMessage();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            fit: StackFit.loose,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    height: 65,
                    child: Container(
                      color: myColors.blue.withOpacity(1),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                receiver_name ?? "User Chat",
                                style: TextStyle(color: Colors.white, fontSize: 15),
                              ),
                              /*Text(
                                "online",
                                style: TextStyle(color: Colors.white60, fontSize: 12),
                              ),
                              Container(
                                child: ClipRRect(
                                  child: Container(
                                      child: SizedBox(
                                        child: Image.asset(
                                          "assets/images/person1.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      color: myColors.orange),
                                  borderRadius: new BorderRadius.circular(50),
                                ),
                                height: 55,
                                width: 55,
                                padding: const EdgeInsets.all(0.0),
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 5.0,
                                          spreadRadius: -1,
                                          offset: Offset(0.0, 5.0))
                                    ]),
                              ), // Container
                              */
                            ],
                          ),
                          Spacer(),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                            child: RaisedButton(
                              onPressed: () {
                                setState() {
                                  // _isLoading = true;
                                }
                                print("Calling..${conversation}");
                                placeCall(conversation);
                              },
                              elevation: 0.0,
                              color: Colors.purple,
                              child: Text("Call", style: TextStyle(color: Colors.white70)),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                            )
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 0,
                    color: Colors.black54,
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    // height: 500,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/chat-background-1.jpg"),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.linearToSrgbGamma()),
                      ),
                      child: SingleChildScrollView(
                          controller: _scrollController,
                          // reverse: true,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: childList,
                          )),
                    ),
                  ),
                  Divider(height: 0, color: Colors.black26),
                  // SizedBox(
                  //   height: 50,
                  Container(
                    color: Colors.white,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextField(
                        maxLines: 20,
                        controller: _text,
                        decoration: InputDecoration(
                          // contentPadding: const EdgeInsets.symmetric(horizontal: 5.0),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.send),
                            onPressed: () {
                              sendMessage();
                            },
                          ),
                          border: InputBorder.none,
                          hintText: "enter your message",
                        ),
                      ),
                    ),
                  ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


