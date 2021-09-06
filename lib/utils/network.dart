import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shop/screens/home.dart';
import 'package:shop/widgets/widgets.dart';

// class HttpHelper {
//   static const String LOGIN = 'login';
//   static  var res;
//   static  var err;
//   static void postData(
//       {@required String email, @required password, @required url}) async {
//       http.Response response = await http.post(
//       Uri.parse('https://student.valuxapps.com/api/' + url),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'email': email, 'password': password}),
//     );
//       err = jsonDecode(response.body)['status'];
//      res = jsonDecode(response.body)['message'];
//      if(err.toString() == 'false'){
//        showMessage(message: res,color: Colors.red);
//
//      }else{
//        showMessage(message: res,color: Colors.green);
//        moveToPage(pageName: HomePage.id);
//      }
//
//     return res;
//   }
// }

class DioHelper {
  static final String URL = 'https://student.valuxapps.com/api/';

 static void userLogin(
      {@required String url,
      @required String email,
      @required String password}) async {
      try{

        http.Response response = await http.post(Uri.parse(URL+'login',
        ),headers: {
          'Content-Type':'application/json'
        },body: jsonEncode({
          'email':email,
          'password':password
        }));

        var res = jsonDecode(response.body)['message'];
        var err = jsonDecode(response.body)['status'];
        if(err.toString() == 'false'){
          showMessage(message: res,color: Colors.red);
        }else{
          showMessage(message: res,color: Colors.green);
        }

        return jsonDecode(response.body);


      }on PlatformException catch(e){
        print(e.message);
        showMessage(message: e.message,color: Colors.red);
      }
  }
}
