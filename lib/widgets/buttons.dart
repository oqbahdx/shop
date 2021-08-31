import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/styles/text.dart';

Widget defaultTextFormField(
    {String text,
    IconData icn,
    TextEditingController controller,
    TextInputType type,
    bool sec = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: TextFormField(
      keyboardType: type,
      controller: controller,
      obscureText: sec,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: text,
        prefixIcon: Icon(icn),
      ),
    ),
  );
}

Widget defaultSubmitButton({String text,Function onPress,Color color,double height = 50}){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: color
    ),
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(child: Text(text,style: titleStyle,)),
    ),
    onPressed:onPress,
  );
}
