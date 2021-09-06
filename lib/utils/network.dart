import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/widgets/widgets.dart';

class HttpHelper {
  static const String LOGIN = 'login';
  static  var res;
  static  var err;
  static void postData(
      {@required String email, @required password, @required url}) async {
      http.Response response = await http.post(
      Uri.parse('https://student.valuxapps.com/api/' + url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
      err = jsonDecode(response.body)['status'];
     res = jsonDecode(response.body)['message'];
     if(err == 'false'){
       showMessage(message: res,color: Colors.red);
     }else{
       showMessage(message: res,color: Colors.green);
     }

    return res;
  }
}
