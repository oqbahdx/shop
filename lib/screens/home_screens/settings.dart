import 'package:flutter/material.dart';
import 'package:shop/styles/text.dart';


class Settings extends StatefulWidget {


  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('SETTINGS',style: titleStyle,),
      ),
    );
  }
}