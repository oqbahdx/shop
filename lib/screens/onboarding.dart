import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'On Boarding',
          style: TextStyle(
              fontSize: 35, fontFamily: 'Opti', fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
