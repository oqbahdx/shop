import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:shop/utils/shared_prefrences.dart';
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

  // static Future<Response> getDioData({
  //   @required String url,
  //    String token,
  //   Map<String, dynamic> query,
  // }) async {
  //   dio = Dio(BaseOptions(
  //       baseUrl: 'https://student.valuxapps.com/api/',
  //       receiveDataWhenStatusError: true,
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'lang': 'en',
  //         'Authorization': token ?? ''
  //       }));
  //   return await dio.get(url, queryParameters: query??null);
  // }

  static Future getHttpData()async{
    final String url = 'https://student.valuxapps.com/api/home';

    http.Response response = await http.get(Uri.parse(url),headers: {
      'Content-Type': 'application/json',
      'lang': 'en',
       'Authorization': token ?? ''
    });
    if(response.statusCode != 200) return null;
      return json.decode(response.body);


  }

  static Future getCategories()async{
    final String url = 'https://student.valuxapps.com/api/categories';
    http.Response response = await http.get(Uri.parse(url),
    headers: {'lang':'en'}
    );
    if(response.statusCode !=200) return null;
    return json.decode(response.body);
  }

  static Future getFavorite(int productId)async{
    final String url = 'https://student.valuxapps.com/api/favorites';
    http.Response response = await http.post(Uri.parse(url),
    headers: {
      'lang':'en',
      'Content-Type':'application/json',
      'Authorization':token,
    },
      body: jsonEncode({
        'product_id':productId
      }),
    );
    if(response.statusCode !=200) return null;
    return json.decode(response.body);
  }

  static Future getAllFavorite()async{
    final String url = 'https://student.valuxapps.com/api/favorites';
    http.Response response = await http.get(Uri.parse(url),
        headers: {'lang':'en',
         'Content-Type':'application/json',
         'Authorization':token,}
    );
    if(response.statusCode !=200) return null;
    return json.decode(response.body);
  }

  static Future getProfile()async{
    final String url = "https://student.valuxapps.com/api/profile";

    http.Response response = await http.get(Uri.parse(url),headers: {
      'lang':'en',
      'Content-Type':'application/json',
      'Authorization':token,
    });

    if(response.statusCode != 200) return null;
    return jsonDecode(response.body);
  }

}
