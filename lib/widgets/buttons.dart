import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/styles/text.dart';

Widget defaultTextFormField(
    {String text,
    IconData icn,
    TextEditingController controller,
    TextInputType type,
      function(String value),
      Widget showPass,
    bool sec = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: TextFormField(
      keyboardType: type,
      controller: controller,
      obscureText: sec,
      validator: function,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: text,
        prefixIcon: Icon(icn),
        suffixIcon: showPass
      ),
    ),
  );
}

Widget defaultSubmitButton({String text,Function onPress,Color color,double height = 50,}){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color
      ),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: Text(text,style: titleStyle,)),
      ),
      onPressed:onPress,
    ),
  );
}
