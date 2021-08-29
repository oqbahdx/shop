import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  List<String> _images = [
    '',
    '',
    '',

  ];
  List<String> _texts = [
    'Page one',
    'Page tow',
    'Page three',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: null,
    );
  }
}
