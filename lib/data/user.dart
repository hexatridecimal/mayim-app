import 'package:flutter/material.dart';
import 'package:flutter_data/flutter_data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mayim/Global/JsonPlaceholderAdapter.dart';

part 'user.g.dart';

@JsonSerializable()
@DataRepository([StandardJSONAdapter, JSONPlaceholderAdapter])
class User extends DataSupport<User> {
  @override
  final int id;
  final String name;
  final String email;
  final String phoneNumber;
  User({
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.phoneNumber,
  });
}
