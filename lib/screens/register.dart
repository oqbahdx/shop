import 'package:flutter/material.dart';
import 'package:shop/styles/text.dart';
import 'package:shop/widgets/buttons.dart';
import 'package:shop/widgets/responsive.dart';
import 'package:shop/widgets/widgets.dart';

import 'login.dart';

class RegisterPage extends StatefulWidget {
static String id = "RegisterPage";
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    double hM = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Register',style: titleStyle,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            sBox(height: hM*0.05),
            defaultTextFormField(text: 'Name',icn: Icons.person,controller:nameController ,type: TextInputType.name),
            sBox(height: hM*0.05),
            defaultTextFormField(text: 'Email',icn: Icons.email,controller: emailController,type: TextInputType.emailAddress),
            sBox(height: hM*0.05),
            defaultTextFormField(text: 'Password',icn: Icons.enhanced_encryption,controller: passwordController,sec: hidePassword,type: TextInputType.text,showPass: IconButton(icon: Icon(hidePassword?Icons.visibility:Icons.visibility_off), onPressed: (){
              setState(() {
                hidePassword = !hidePassword;
              });
            })),
            sBox(height: hM*0.05),
            defaultTextFormField(text: 'Phone',icn: Icons.person,controller: phoneController,type: TextInputType.phone),
            sBox(height:hM* 0.15),
            defaultSubmitButton(text: 'Register',onPress: (){}),
            sBox(height: hM*0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t you have an account ? ',style: textStyle,),
                TextButton(onPressed:(){
                  moveToPage(context,LoginPage.id);
                }, child:Text('Sign in',style: textStyle))
              ],)
          ],
        ),

      ),
    );
  }
}
