import 'package:flutter_data/flutter_data.dart';
import 'package:mayim/Global/BaseAdapter.dart';

mixin LocalCacheAdapter<T extends DataSupport<T>> on BaseAdapter<T> {
  @override
  Future<T> save(model, {bool remote, Map<String, dynamic> params, Map<String, dynamic> headers}) {
    return super.save(model, remote: false); 
  }
}
