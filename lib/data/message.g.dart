// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// DataGenerator
// **************************************************************************

// ignore_for_file: unused_local_variable
// ignore_for_file: always_declare_return_types
class _$MessageRepository extends Repository<Message> {
  _$MessageRepository(LocalAdapter<Message> adapter,
      {bool remote, bool verbose})
      : super(adapter, remote: remote, verbose: verbose);

  @override
  get relationshipMetadata => {
        'HasMany': {},
        'BelongsTo': {'conversation': 'conversations'}
      };

  @override
  Repository repositoryFor(String type) {
    return <String, Repository>{
      'conversations': manager.locator<Repository<Conversation>>()
    }[type];
  }
}

class $MessageRepository extends _$MessageRepository
    with StandardJSONAdapter<Message>, BaseAdapter<Message> {
  $MessageRepository(LocalAdapter<Message> adapter, {bool remote, bool verbose})
      : super(adapter, remote: remote, verbose: verbose);
}

// ignore: must_be_immutable, unused_local_variable
class $MessageLocalAdapter extends LocalAdapter<Message> {
  $MessageLocalAdapter(DataManager manager, {List<int> encryptionKey, box})
      : super(manager, encryptionKey: encryptionKey, box: box);

  @override
  deserialize(map) {
    map['conversation'] = {
      '_': [map['conversation'], manager]
    };
    return _$MessageFromJson(map);
  }

  @override
  serialize(model) {
    final map = _$MessageToJson(model);
    map['conversation'] = model.conversation?.toJson();
    return map;
  }

  @override
  setOwnerInRelationships(owner, model) {
    model.conversation?.owner = owner;
  }

  @override
  void setInverseInModel(inverse, model) {
    if (inverse is DataId<Conversation>) {
      model.conversation?.inverse = inverse;
    }
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
    id: json['id'] as int,
    userId: json['userId'] as int,
    conversation: json['conversation'] == null
        ? null
        : BelongsTo.fromJson(json['conversation'] as Map<String, dynamic>),
    timestamp: json['timestamp'] as int,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'conversation': instance.conversation,
      'timestamp': instance.timestamp,
      'message': instance.message,
    };
