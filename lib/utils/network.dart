import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/widgets/widgets.dart';

class HttpHelper {
  static Dio dio;

  // static init() {
  //   dio = Dio(BaseOptions(
  //       baseUrl: 'https://student.valuxapp.com/api',
  //       receiveDataWhenStatusError: true,
  //       headers: {'Content-Type': 'application/json'}));
  // }

  static String url = 'https://student.valuxapp.com/api';

  // static Future userLogin({Map<String, dynamic> body, String token}) async {
  //   http.Response response = await http.post(
  //     Uri.parse('https://student.valuxapps.com/api/login'),
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'lang': 'ar',
  //       'Authorization': token
  //     },
  //     body: jsonEncode(body),
  //   );
  //   var st = jsonDecode(response.body)['status'];
  //   var res = jsonDecode(response.body)['message'];
  //   if (st.toString() == 'false') {
  //     showMessage(message: res.toString(), color: Colors.red);
  //   } else {
  //     showMessage(message: res.toString(), color: Colors.green);
  //   }
  //   return jsonDecode(response.body)['message'];
  // }

  static Future<Response> userDioLogin({
    @required String url,
    @required Map<String, dynamic> data,
    Map<String, dynamic> query,
  }) async {
    dio = Dio(BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        headers: {'Content-Type': 'application/json'}));
    dio.options.headers = {
      'lang':'ar'
    };
    return await dio.post(url, data: data, queryParameters: query);
  }
}
