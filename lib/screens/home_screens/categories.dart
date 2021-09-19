import 'package:flutter/material.dart';
import 'package:shop/styles/text.dart';


class Categories extends StatefulWidget {
  static String id = 'Categories';


  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('CATEGORIES',style: titleStyle,),
      ),
    );
  }
}
