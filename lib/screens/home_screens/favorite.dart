import 'package:flutter/material.dart';
import 'package:shop/styles/text.dart';

class Favorite extends StatefulWidget {


  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('FAVORITE',style: titleStyle,),
      ),
    );
  }
}