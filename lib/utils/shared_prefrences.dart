import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shared{



  Future<bool> saveData({
  @required String key,
    @required dynamic value
})async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    if(value is String) return await pref.setString(key, value);
    if(value is int) return await pref.setInt(key, value);
    if(value is bool) return await pref.setBool(key, value);
    else return await pref.setDouble(key, value);


  }


}