import 'package:flutter/material.dart';
import 'package:flutter_data/flutter_data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mayim/Global/JsonPlaceholderAdapter.dart';

part 'message.g.dart';

@JsonSerializable()
@DataRepository([StandardJSONAdapter, JSONPlaceholderAdapter])
class Message extends DataSupport<Message> {
  @override
  final int id;
  final int userId;
  final int conversationId;
  final int timestamp;
  final String message;
  Message({
    @required this.id,
    @required this.userId,
    @required this.conversationId,
    @required this.timestamp,
    @required this.message,
  });
}
