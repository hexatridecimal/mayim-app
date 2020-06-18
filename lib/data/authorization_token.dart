import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_data/flutter_data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mayim/Global/BaseAdapter.dart';
import 'package:mayim/Global/LocalCacheAdapter.dart';

part 'authorization_token.g.dart';

mixin AuthenticationAdapter on Repository<AuthorizationToken> {
  Future<void> login(
      {@required String email, @required String password}) async {
    final Map<String, String> credentials = {
      "user[email]": email,
      "user[password]": password,
    };
    final response = await withHttpClient((client) => client.post(
        "$baseUrl/login",
        headers: Map<String, String>.from(headers),
        body: jsonEncode(credentials)));
    final token = withResponse(response, (data) => deserialize(data));
    save(token);
  }

  @override
  Future<List<AuthorizationToken>> findAll({bool remote, Map<String, dynamic> params, Map<String, dynamic> headers}) {
    return super.findAll(remote: false);
  }
  
  @override
  String get baseUrl => super.baseUrl.replaceFirst(RegExp(r'api/v1/'), '');
}

@JsonSerializable()
@DataRepository([
  StandardJSONAdapter,
  BaseAdapter,
  LocalCacheAdapter,
  AuthenticationAdapter,
  OfflineAdapter
])
class AuthorizationToken extends DataSupport<AuthorizationToken> {
  @override
  final int id;
  final String token;

  AuthorizationToken({
    @required this.id,
    @required this.token,
  });

  String toString() => token;
}
