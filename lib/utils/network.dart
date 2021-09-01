
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioUrl{

  static Dio dio;

  void init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type':'application/json'
        }
      )
    );

  }
  static Future<Response> getData({
  @required String url,
    @required Map<String,dynamic> query
})async{
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({@required String url,
    @required Map<String,dynamic> query,Map<String,dynamic> data})async{
    return await dio.post(url,
    queryParameters: query,
    data: data);
  }
}

const String LOGIN = 'login';