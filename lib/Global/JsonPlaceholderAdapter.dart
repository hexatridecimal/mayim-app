import 'package:flutter_data/flutter_data.dart';

mixin JSONPlaceholderAdapter<T extends DataSupport<T>> on Repository<T> {
  @override
  String get baseUrl => "http://jsonplaceholder.typicode.com";
}