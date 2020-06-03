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
  get relationshipMetadata => {'HasMany': {}, 'BelongsTo': {}};

  @override
  Repository repositoryFor(String type) {
    return <String, Repository>{}[type];
  }
}

class $MessageRepository extends _$MessageRepository
    with StandardJSONAdapter<Message>, JSONPlaceholderAdapter<Message> {
  $MessageRepository(LocalAdapter<Message> adapter, {bool remote, bool verbose})
      : super(adapter, remote: remote, verbose: verbose);
}

// ignore: must_be_immutable, unused_local_variable
class $MessageLocalAdapter extends LocalAdapter<Message> {
  $MessageLocalAdapter(DataManager manager, {List<int> encryptionKey, box})
      : super(manager, encryptionKey: encryptionKey, box: box);

  @override
  deserialize(map) {
    return _$MessageFromJson(map);
  }

  @override
  serialize(model) {
    final map = _$MessageToJson(model);

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

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
    id: json['id'] as int,
    userId: json['userId'] as int,
    conversationId: json['conversationId'] as int,
    timestamp: json['timestamp'] as int,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'conversationId': instance.conversationId,
      'timestamp': instance.timestamp,
      'message': instance.message,
    };
