import 'package:flutter/material.dart';
import 'package:shop/screens/register.dart';
import 'package:shop/styles/text.dart';
import 'package:shop/widgets/buttons.dart';
import 'package:shop/widgets/responsive.dart';
import 'package:shop/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  static String id = "LoginPage";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool hidePassword = true;
  Widget build(BuildContext context) {
    double hM = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Login Page',
            style: titleStyle,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              sBox(height: hM * 0.25),
              defaultTextFormField(
                text: 'Email',
                icn: Icons.email,
                controller: emailController,
                type: TextInputType.emailAddress,
              ),
              sBox(height: hM * 0.05),
              defaultTextFormField(
                  text: 'Password',
                  icn: Icons.enhanced_encryption,
                  controller: passwordController,
                  sec: hidePassword,
                  showPass: IconButton(icon:Icon(hidePassword?Icons.visibility:Icons.visibility_off),
                      onPressed:(){
                    setState(() {
                      hidePassword = !hidePassword;
                      print(hidePassword);
                    });
                      }),
                  type: TextInputType.text),
              sBox(height: hM * 0.15),
              defaultSubmitButton(text: 'Login', onPress: () {
                showMessage(message: 'this is a test',color: Colors.red);
              }),
              sBox(height: hM * 0.10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Do you have an account ? ',style: textStyle,),
                  TextButton(onPressed:(){
                    moveToPage(context, RegisterPage.id);
                  }, child:Text('Sign up',style: textStyle))
                ],)
            ],
          ),

        ));
  }
}
