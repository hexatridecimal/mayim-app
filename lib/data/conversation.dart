import 'package:flutter/material.dart';
import 'package:flutter_data/annotations.dart';
import 'package:flutter_data/flutter_data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mayim/Global/BaseAdapter.dart';
import 'package:mayim/data/message.dart';

part 'conversation.g.dart';

@JsonSerializable()
@DataRepository([StandardJSONAdapter, BaseAdapter])
class Conversation extends DataSupport<Conversation> {
  @override
  final int id;
  final HasMany<Message> messages;
  Conversation({@required this.id, @required this.messages});
}