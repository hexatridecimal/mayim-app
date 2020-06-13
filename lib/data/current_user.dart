import 'package:flutter/foundation.dart';
import 'package:flutter_data/annotations.dart';
import 'package:flutter_data/flutter_data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mayim/Global/BaseAdapter.dart';

part 'current_user.g.dart';

mixin CurrentUserAdapter on Repository<CurrentUser> {
  @override
  Future<List<CurrentUser>> findAll({bool remote, Map<String, dynamic> params, Map<String, dynamic> headers}) async {
    final currentUser = await findOne(1, remote: remote, params: params, headers: headers);
    return Future.value([currentUser]);
  }

  @override
  Future<CurrentUser> save(CurrentUser model, {bool remote, Map<String, dynamic> params, Map<String, dynamic> headers}) {
    return super.save(model, remote: false);
  } 
  
}

@JsonSerializable()
@DataRepository([StandardJSONAdapter, BaseAdapter, CurrentUserAdapter, OfflineAdapter])
class CurrentUser extends DataSupport<CurrentUser> {
  @override
  final int id;
  final int userId;

  CurrentUser({ @required this.id, @required this.userId }); 
}