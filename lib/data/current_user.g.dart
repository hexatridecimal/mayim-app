// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_user.dart';

// **************************************************************************
// DataGenerator
// **************************************************************************

// ignore_for_file: unused_local_variable
// ignore_for_file: always_declare_return_types
class _$CurrentUserRepository extends Repository<CurrentUser> {
  _$CurrentUserRepository(LocalAdapter<CurrentUser> adapter,
      {bool remote, bool verbose})
      : super(adapter, remote: remote, verbose: verbose);

  @override
  get relationshipMetadata => {'HasMany': {}, 'BelongsTo': {}};

  @override
  Repository repositoryFor(String type) {
    return <String, Repository>{}[type];
  }
}

class $CurrentUserRepository extends _$CurrentUserRepository
    with
        StandardJSONAdapter<CurrentUser>,
        BaseAdapter<CurrentUser>,
        CurrentUserAdapter,
        OfflineAdapter<CurrentUser> {
  $CurrentUserRepository(LocalAdapter<CurrentUser> adapter,
      {bool remote, bool verbose})
      : super(adapter, remote: remote, verbose: verbose);
}

// ignore: must_be_immutable, unused_local_variable
class $CurrentUserLocalAdapter extends LocalAdapter<CurrentUser> {
  $CurrentUserLocalAdapter(DataManager manager, {List<int> encryptionKey, box})
      : super(manager, encryptionKey: encryptionKey, box: box);

  @override
  deserialize(map) {
    return _$CurrentUserFromJson(map);
  }

  @override
  serialize(model) {
    final map = _$CurrentUserToJson(model);

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

CurrentUser _$CurrentUserFromJson(Map<String, dynamic> json) {
  return CurrentUser(
    id: json['id'] as int,
    userId: json['userId'] as int,
  );
}

Map<String, dynamic> _$CurrentUserToJson(CurrentUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
    };
