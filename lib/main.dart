import 'package:flutter/material.dart';
import 'package:shop/screens/home.dart';
import 'package:shop/screens/login.dart';
import 'package:shop/screens/onboarding.dart';
import 'package:shop/screens/register.dart';
import 'package:shop/utils/shared_prefrences.dart';
import 'package:shop/widgets/widgets.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
   Widget widget;
   bool onBoarding = await  Shared.getData(key: 'onBoarding');
   String token = await Shared.getData(key: 'token');
  print(onBoarding);
 if(onBoarding !=null){
   if(token !=null)  widget = HomePage();
   else widget = LoginPage();
 }else{
   widget = OnBoarding();
 }

  runApp(MyApp(start: widget));
}

class MyApp extends StatelessWidget {
  Widget start;
  MyApp({this.start});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: start,
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
