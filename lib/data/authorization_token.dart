import 'package:flutter/foundation.dart';
import 'package:flutter_data/flutter_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'authorization_token.g.dart';

@JsonSerializable()
class AuthorizationToken extends DataSupport<AuthorizationToken> {
  @override
  final int id;
  final String token;
  final String userId;

  AuthorizationToken({
    @required this.id,
    @required this.token,
    @required this.userId,
  });
}
