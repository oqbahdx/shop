import 'package:flutter/material.dart';
import 'package:shop/styles/text.dart';
import 'package:shop/widgets/buttons.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login Page',
          style: titleStyle,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: defaultSubmitButton(text: 'login',onPress: (){},),
        ) ),
    );
  }
}
