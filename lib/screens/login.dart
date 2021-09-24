import 'package:conditional_builder/conditional_builder.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/screens/home.dart';

import 'package:shop/screens/register.dart';
import 'package:shop/state_management/cubit.dart';
import 'package:shop/state_management/states.dart';
import 'package:shop/styles/text.dart';
import 'package:shop/utils/shared_prefrences.dart';

import 'package:shop/widgets/buttons.dart';
import 'package:shop/widgets/responsive.dart';
import 'package:shop/widgets/widgets.dart';



class LoginPage extends StatefulWidget {

  static String id = "LoginPage";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Widget build(BuildContext context) {
    double hM = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (BuildContext context) => ShopCubit(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {
          if(state is ShopSuccessState)
            if(state.loginModel.status){
              showMessage(message: state.loginModel.message,color: Colors.green);
              print(state.loginModel.message);
              print(state.loginModel.data.token);
              Shared.saveData(key: 'token', value: state.loginModel.data.token);
              moveToPage(context: context,pageName: HomePage.id);
            }else{
              showMessage(message: state.loginModel.message,color: Colors.red);
              print(state.loginModel.message);
            }

        },
        builder: (context, state) {
          return SafeArea(

            child: Scaffold(
                appBar: AppBar(
                  title: Text(
                    'Login Page',
                    style: titleStyle,
                  ),
                  centerTitle: true,
                ),
                body: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        sBox(height: hM * 0.25),
                        defaultTextFormField(
                          text: 'Email',
                          icn: Icons.email,
                          controller: emailController,
                          function: (String value) {
                            if (value.isEmpty) return 'enter the email';
                          },
                          type: TextInputType.emailAddress,
                        ),
                        sBox(height: hM * 0.05),
                        defaultTextFormField(
                            text: 'Password',
                            icn: Icons.enhanced_encryption,
                            controller: passwordController,
                            sec: ShopCubit.get(context).isVisible,
                            function: (String value) {

                              if (value.isEmpty) return 'enter the password';
                            },
                            showPass: IconButton(onPressed:(){
                              ShopCubit.get(context).changeIconVisibility();
                            },
                                icon:Icon(ShopCubit.get(context).icon)),

                            type: TextInputType.text),
                        sBox(height: hM * 0.15),
                        ConditionalBuilder(
                          condition: state is! ShopLoadingState,
                          builder: (context) => defaultSubmitButton(
                              text: 'Login',
                              onPress: () {
                                if (formKey.currentState.validate()) {
                                  ShopCubit.get(context).postData(
                                    email: emailController.text,
                                    password: passwordController.text);


                                }
                              }),
                          fallback: (context) => CircularProgressIndicator(),
                        ),
                        sBox(height: hM * 0.10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Do you have an account ? ',
                              style: textStyle,
                            ),
                            TextButton(
                                onPressed: () {
                                  moveToPage(
                                      context: context,
                                      pageName: RegisterPage.id);
                                },
                                child: Text('Sign up', style: textStyle))
                          ],
                        )
                      ],
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}
