import 'package:flutter/material.dart';
import 'package:shop/styles/text.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login Page',
          style: Style.titleStyle,
        ),
        centerTitle: true,
      ),
    );
  }
}
