import 'package:flutter/material.dart';
import 'package:flutter_data/flutter_data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mayim/Global/BaseAdapter.dart';
import 'package:mayim/data/message.dart';

part 'user.g.dart';

@JsonSerializable()
@DataRepository([StandardJSONAdapter, BaseAdapter])
class User extends DataSupport<User> {
  @override
  final int id;
  final String name;
  final String email;
  final String phoneNumber;
  final HasMany<Message> messages;
  User({
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.phoneNumber,
    @required this.messages,
  });
}
