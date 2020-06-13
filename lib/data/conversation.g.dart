// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// DataGenerator
// **************************************************************************

// ignore_for_file: unused_local_variable
// ignore_for_file: always_declare_return_types
class _$ConversationRepository extends Repository<Conversation> {
  _$ConversationRepository(LocalAdapter<Conversation> adapter,
      {bool remote, bool verbose})
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

class $ConversationRepository extends _$ConversationRepository
    with StandardJSONAdapter<Conversation>, BaseAdapter<Conversation> {
  $ConversationRepository(LocalAdapter<Conversation> adapter,
      {bool remote, bool verbose})
      : super(adapter, remote: remote, verbose: verbose);
}

// ignore: must_be_immutable, unused_local_variable
class $ConversationLocalAdapter extends LocalAdapter<Conversation> {
  $ConversationLocalAdapter(DataManager manager, {List<int> encryptionKey, box})
      : super(manager, encryptionKey: encryptionKey, box: box);

  @override
  deserialize(map) {
    map['messages'] = {
      '_': [map['messages'], manager]
    };
    return _$ConversationFromJson(map);
  }

  @override
  serialize(model) {
    final map = _$ConversationToJson(model);
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

Conversation _$ConversationFromJson(Map<String, dynamic> json) {
  return Conversation(
    id: json['id'] as int,
    messages: json['messages'] == null
        ? null
        : HasMany.fromJson(json['messages'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ConversationToJson(Conversation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'messages': instance.messages,
    };
