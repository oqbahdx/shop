import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HttpHelper {
  static Dio dio;

  static String url = 'https://student.valuxapp.com/api';

  static Future<Response> userDioLogin({
    @required String url,
    @required Map<String, dynamic> data,
    Map<String, dynamic> query,
  }) async {
    dio = Dio(BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        headers: {'Content-Type': 'application/json', 'lang': 'ar'}));

    return await dio.post(url, data: data, queryParameters: query);
  }

  static Future<Response> getDioData({
    @required String url,
     String token,
    Map<String, dynamic> query,
  }) async {
    dio = Dio(BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
          'lang': 'en',
          'Authorization': token ?? ''
        }));
    return await dio.get(url, queryParameters: query??null);
  }
}
