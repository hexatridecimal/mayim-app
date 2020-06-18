import 'dart:io';

import 'package:flutter_data/flutter_data.dart';
import 'package:mayim/bloc/authentication_bloc.dart';

mixin BaseAdapter<T extends DataSupport<T>> on StandardJSONAdapter<T> {
  static const bool _emulatedEnvironment = true;
  @override
  get headers {
    // ignore: close_sinks
    final authBloc = manager.locator<AuthenticationBloc>();
    final state = authBloc?.state;
    if (state is Authenticated) {
      try {
        return super.headers..addAll({"Authorization": state.token});
      } catch (error) {
        authBloc.add(AuthorizationFailed(error: error));
        return super.headers; 
      }
    } else {
      return super.headers;
    }
  }

  @override
  String get baseUrl {
    if (_emulatedEnvironment) {
      return "http://10.0.2.2:3000/api/v1/";
    }
    return "http://127.0.0.1:3000/api/v1/";
  }

  @override
  Future<List<T>> findAll({bool remote, Map<String, dynamic> params, Map<String, dynamic> headers}) async {
    try {
      final response = await super.findAll(remote: remote, params: params, headers: headers);
      return response;
    } on SocketException catch (e) {
      if (remote == false) throw e;
      return await super.findAll(remote: false);
    } 
  }
}
