import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
showMessage({String message,Color color}){
  return  Fluttertoast.showToast(msg: message,
  backgroundColor: color,
    fontSize: 22,
    textColor: Colors.white,
  );
}

 moveToPage({BuildContext context,String pageName}){
  return Navigator.of(context).pushReplacementNamed(pageName);
}

