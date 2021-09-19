import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/screens/home.dart';
import 'package:shop/screens/home_screens/categories.dart';
import 'package:shop/screens/home_screens/favorite.dart';
import 'package:shop/screens/home_screens/products.dart';
import 'package:shop/screens/home_screens/search.dart';
import 'package:shop/screens/login.dart';
import 'package:shop/screens/onboarding.dart';
import 'package:shop/screens/register.dart';
import 'package:shop/state_management/cubit.dart';
import 'package:shop/utils/shared_prefrences.dart';


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
    return BlocProvider(
      create: (context)=>ShopCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: start,
        routes: {
          OnBoarding.id:(context)=>OnBoarding(),
          LoginPage.id:(context)=>LoginPage(),
          RegisterPage.id:(context)=>RegisterPage(),
          HomePage.id:(context)=>HomePage(),
          Search.id:(context)=>Search(),
         ProductsPage.id:(context)=>ProductsPage(),
          Favorite.id:(context)=>Favorite(),
          Categories.id:(context)=>Categories()
        },
        theme: ThemeData(
          fontFamily: 'Opti'
        ),
      ),
    );
  }
}
