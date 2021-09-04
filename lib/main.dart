import 'package:flutter/material.dart';
import 'package:shop/screens/home.dart';
import 'package:shop/screens/login.dart';
import 'package:shop/screens/onboarding.dart';
import 'package:shop/screens/register.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: OnBoarding.id,
      routes: {
        OnBoarding.id:(context)=>OnBoarding(),
        LoginPage.id:(context)=>LoginPage(),
        RegisterPage.id:(context)=>RegisterPage(),
        HomePage.id:(context)=>HomePage(),
      },
      theme: ThemeData(
        fontFamily: 'Opti'
      ),
    );
  }
}
