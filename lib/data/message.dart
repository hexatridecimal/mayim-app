import 'package:flutter/material.dart';
import 'package:flutter_data/flutter_data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mayim/Global/BaseAdapter.dart';
import 'package:mayim/data/conversation.dart';

part 'message.g.dart';

@JsonSerializable()
@DataRepository([StandardJSONAdapter, BaseAdapter])
class Message extends DataSupport<Message> {
  @override
  final int id;
  final int userId;
  final BelongsTo<Conversation> conversation;
  final int timestamp;
  final String message;
  Message({
    @required this.id,
    @required this.userId,
    @required this.conversation,
    @required this.timestamp,
    @required this.message,
  });
}
