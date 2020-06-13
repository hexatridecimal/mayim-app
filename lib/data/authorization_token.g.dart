// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization_token.dart';

// **************************************************************************
// DataGenerator
// **************************************************************************

// ignore_for_file: unused_local_variable
// ignore_for_file: always_declare_return_types
class _$AuthorizationTokenRepository extends Repository<AuthorizationToken> {
  _$AuthorizationTokenRepository(LocalAdapter<AuthorizationToken> adapter,
      {bool remote, bool verbose})
      : super(adapter, remote: remote, verbose: verbose);

  @override
  get relationshipMetadata => {'HasMany': {}, 'BelongsTo': {}};

  @override
  Repository repositoryFor(String type) {
    return <String, Repository>{}[type];
  }
}

class $AuthorizationTokenRepository extends _$AuthorizationTokenRepository
    with
        StandardJSONAdapter<AuthorizationToken>,
        BaseAdapter<AuthorizationToken>,
        LocalCacheAdapter<AuthorizationToken>,
        AuthenticationAdapter,
        OfflineAdapter<AuthorizationToken> {
  $AuthorizationTokenRepository(LocalAdapter<AuthorizationToken> adapter,
      {bool remote, bool verbose})
      : super(adapter, remote: remote, verbose: verbose);
}

// ignore: must_be_immutable, unused_local_variable
class $AuthorizationTokenLocalAdapter extends LocalAdapter<AuthorizationToken> {
  $AuthorizationTokenLocalAdapter(DataManager manager,
      {List<int> encryptionKey, box})
      : super(manager, encryptionKey: encryptionKey, box: box);

  @override
  deserialize(map) {
    return _$AuthorizationTokenFromJson(map);
  }

  @override
  serialize(model) {
    final map = _$AuthorizationTokenToJson(model);

    return map;
  }

  @override
  setOwnerInRelationships(owner, model) {}

  @override
  void setInverseInModel(inverse, model) {}
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorizationToken _$AuthorizationTokenFromJson(Map<String, dynamic> json) {
  return AuthorizationToken(
    id: json['id'] as int,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$AuthorizationTokenToJson(AuthorizationToken instance) =>
    <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
    };
