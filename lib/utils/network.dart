import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  static const String LOGIN = 'login';

  static void postData(
      {@required String email, @required password, @required url}) async {
    http.Response response = await http.post(
      Uri.parse('https://student.valuxapps.com/api/' + url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    var res = jsonDecode(response.body)['message'];
    print(res.toString());
    return res;
  }
}
