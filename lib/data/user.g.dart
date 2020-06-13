// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// DataGenerator
// **************************************************************************

// ignore_for_file: unused_local_variable
// ignore_for_file: always_declare_return_types
class _$UserRepository extends Repository<User> {
  _$UserRepository(LocalAdapter<User> adapter, {bool remote, bool verbose})
      : super(adapter, remote: remote, verbose: verbose);

  @override
  get relationshipMetadata => {
        'HasMany': {'messages': 'messages'},
        'BelongsTo': {}
      };

  @override
  Repository repositoryFor(String type) {
    return <String, Repository>{
      'messages': manager.locator<Repository<Message>>()
    }[type];
  }
}

class $UserRepository extends _$UserRepository
    with StandardJSONAdapter<User>, BaseAdapter<User> {
  $UserRepository(LocalAdapter<User> adapter, {bool remote, bool verbose})
      : super(adapter, remote: remote, verbose: verbose);
}

// ignore: must_be_immutable, unused_local_variable
class $UserLocalAdapter extends LocalAdapter<User> {
  $UserLocalAdapter(DataManager manager, {List<int> encryptionKey, box})
      : super(manager, encryptionKey: encryptionKey, box: box);

  @override
  deserialize(map) {
    map['messages'] = {
      '_': [map['messages'], manager]
    };
    return _$UserFromJson(map);
  }

  @override
  serialize(model) {
    final map = _$UserToJson(model);
    map['messages'] = model.messages?.toJson();
    return map;
  }

  @override
  setOwnerInRelationships(owner, model) {
    model.messages?.owner = owner;
  }

  @override
  void setInverseInModel(inverse, model) {
    if (inverse is DataId<Message>) {
      model.messages?.inverse = inverse;
    }
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    name: json['name'] as String,
    email: json['email'] as String,
    phoneNumber: json['phoneNumber'] as String,
    messages: json['messages'] == null
        ? null
        : HasMany.fromJson(json['messages'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'messages': instance.messages,
    };
