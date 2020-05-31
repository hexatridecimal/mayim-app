import 'package:flutter/material.dart';
import 'package:flutter_data/flutter_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
@DataRepository([StandardJSONAdapter])
class Message extends DataSupport<Message> {
  @override
  final int id;
  final int userId;
  final int timestamp;
  final String message;
  Message({
    @required this.id,
    @required this.userId,
    @required this.timestamp,
    @required this.message,
  });
}
