import 'package:flutter/material.dart';
import 'package:shop/styles/text.dart';
import 'package:shop/utils/login_model.dart';
import 'package:shop/utils/shared_prefrences.dart';
import 'package:shop/widgets/widgets.dart';

import 'login.dart';
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
      body: Center(
        child: TextButton(onPressed: ()async{

          Shared.removeData(key:'token');
         moveToPage(context: context,pageName: LoginPage.id);
        },child: Text('log out'),),
      ),
    );
  }
}
