import 'package:flutter/material.dart';
import 'package:flutter_data/flutter_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
@DataRepository([StandardJSONAdapter])
class User extends DataSupport<User> {
  @override
  final int id;
  final String name;
  User({
    @required this.id,
    @required this.name,
  });
}
