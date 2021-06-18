import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mayim/Utils/Constant.dart';

import 'Utils.dart';

class ResponseClass{

  static Future<http.Response> callPostApi(Map<String, dynamic> jsonData, String api, BuildContext context) async {
    final http.Response response = await http.post(
      api,
      // headers: <String, String>{
      //   'Accept': 'application/json',
      //   if (Constant.token != '') 'Authorization': 'Bearer ' + Constant.token,
      // },
      body: jsonData,
    );

    if (response.statusCode == 401) {
      print('ERROR CODE 401 ##');
      // Utils.removeData();
      // Navigator.popUntil(context, (route) => route.isFirst);
      // Navigator.pop(context);
      // Navigator.pushNamed(context, Routes.logInActivity);
    } else if (response.body.contains('\'id\' of non-object')) {
      print('ERROR CODE 401 ##');
      // Utils.removeData();
      // Navigator.popUntil(context, (route) => route.isFirst);
      // Navigator.pop(context);
      // Navigator.pushNamed(context, Routes.logInActivity);
    }

    return response;
  }
  static Future<http.Response> callGetApi(
      String api, BuildContext context) async {
    final http.Response response = await http.get(
      api,
      headers: <String, String>{
        'Accept': 'application/json',
        if (Constant.token != '') 'Authorization': 'Bearer ' + Constant.token,
      },
    );

    print(api);
    // print(Constant.token);
    print(response.body);
    print(response.statusCode);//api ma unauthorise ave che aa kyare ave

    if (response.statusCode == 401) {
      print('ERROR CODE 401 ##');
      // Utils.removeData();
      // Navigator.popUntil(context, (route) => route.isFirst);
      // Navigator.pop(context);
      // Navigator.pushNamed(context, Routes.logInActivity);
    } else if (response.body.contains('\'id\' of non-object')) {
      print('ERROR CODE 401 ##');
      // Utils.removeData();
      // Navigator.popUntil(context, (route) => route.isFirst);
      // Navigator.pop(context);
      // Navigator.pushNamed(context, Routes.logInActivity);
    }

    return response;
  }

}