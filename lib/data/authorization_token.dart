import 'package:flutter/foundation.dart';
import 'package:flutter_data/flutter_data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mayim/Global/BaseAdapter.dart';
import 'package:mayim/Global/LocalCacheAdapter.dart';

part 'authorization_token.g.dart';

mixin AuthenticationAdapter on Repository<AuthorizationToken> {
  Future<void> login(
      {@required String email, @required String password}) async {
    final response = await withHttpClient(
        (client) => client.post("$baseUrl/api/login", headers: headers, body: {
              "email": email,
              "password": password,
            }));
    final token = withResponse(response, (data) => deserialize(data));
    save(token);
  }
}

@JsonSerializable()
@DataRepository([StandardJSONAdapter, BaseAdapter, LocalCacheAdapter, AuthenticationAdapter, OfflineAdapter])
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
