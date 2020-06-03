import 'package:flutter/material.dart';
import 'package:flutter_data/annotations.dart';
import 'package:flutter_data/flutter_data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mayim/Global/JsonPlaceholderAdapter.dart';

part 'conversation.g.dart';

mixin ConversationPlaceholderAdapter on Repository<Conversation> {
 @override
  // TODO: implement type
  String get type => super.type; 
}

@JsonSerializable()
@DataRepository([StandardJSONAdapter, JSONPlaceholderAdapter])
class Conversation extends DataSupport<Conversation> {
  @override
  final int id;
  Conversation({@required this.id});
}