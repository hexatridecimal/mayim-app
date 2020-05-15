import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mayim/Global/Colors.dart' as myColors;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mayim/View/ChatPageView.dart';

class ChatListViewItem extends StatelessWidget {
  final NetworkImage image;
  final String name;
  final String lastMessage;
  final int id;
  final String time;
  final bool hasUnreadMessage;
  final int newMesssageCount;
  const ChatListViewItem({
    Key key,
    this.image,
    this.name,
    this.lastMessage,
    this.id,
    this.time,
    this.hasUnreadMessage,
    this.newMesssageCount,
  }) : super(key: key);

  String getConversationName(String user, int conversation_partner_id) {
    var userProfile = json.decode(user);
    if (userProfile["id"] < conversation_partner_id) {
      return "${userProfile['id']}_${conversation_partner_id}";
    } else {
      return "${conversation_partner_id}_${userProfile['id']}";
    }
  }

  void setConversation(int id) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("user") != null) {
      var conversation = getConversationName(sharedPreferences.getString("user"), id);
      print("setting conversation: ${conversation}");
      sharedPreferences.setString("conversation", conversation);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 10,
                child: ListTile(
                  title: Text(
                    name,
                    style: TextStyle(fontSize: 16),
                  ),
                  subtitle: Text(
                    lastMessage,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: image,
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        time,
                        style: TextStyle(fontSize: 12),
                      ),
                      hasUnreadMessage
                          ? Container(
                              margin: const EdgeInsets.only(top: 5.0),
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                  color: myColors.orange,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25.0),
                                  )),
                              child: Center(
                                  child: Text(
                                newMesssageCount.toString(),
                                style: TextStyle(fontSize: 11),
                              )),
                            )
                          : SizedBox()
                    ],
                  ),
                  onTap: () {
                    setConversation(id);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatPageView(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Divider(
            endIndent: 12.0,
            indent: 12.0,
            height: 0,
          ),
        ],
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Archive',
          color: Colors.blue,
          icon: Icons.archive,
          onTap: () {},
        ),
        IconSlideAction(
          caption: 'Share',
          color: Colors.indigo,
          icon: Icons.share,
          onTap: () {},
        ),
      ],
    );
  }
}
