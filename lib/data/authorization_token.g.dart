// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorizationToken _$AuthorizationTokenFromJson(Map<String, dynamic> json) {
  return AuthorizationToken(
    id: json['id'] as int,
    token: json['token'] as String,
    userId: json['userId'] as String,
  );
}

Map<String, dynamic> _$AuthorizationTokenToJson(AuthorizationToken instance) =>
    <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
      'userId': instance.userId,
    };
