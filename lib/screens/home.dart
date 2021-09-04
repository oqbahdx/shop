import 'package:flutter/material.dart';
import 'package:shop/styles/text.dart';
class HomePage extends StatefulWidget {

  static const String id = "Home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(''
            'Home',style: titleStyle,),
        centerTitle: true,
      ),
    );
  }
}
