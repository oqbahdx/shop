import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/screens/home.dart';
import 'package:shop/screens/register.dart';
import 'package:shop/state_management/cubit.dart';
import 'package:shop/state_management/states.dart';
import 'package:shop/styles/text.dart';
import 'package:shop/utils/network.dart';
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
  bool hidePassword = true;

  Widget build(BuildContext context) {
    double hM = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
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
                          sec: hidePassword,
                          function: (String value) {
                            if (value.isEmpty) return 'enter the password';
                          },
                          showPass: IconButton(
                              icon: Icon(hidePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                  print(hidePassword);
                                });
                              }),
                          type: TextInputType.text),
                      sBox(height: hM * 0.15),
                      ConditionalBuilder(
                        condition: state is! LoginLoadingState,
                        fallback: (context) => CircularProgressIndicator(),
                        builder: (context) => defaultSubmitButton(
                            text: 'Login',
                            onPress: () async {
                              if (formKey.currentState.validate()) {
                                formKey.currentState.save();
                                try {
                                        LoginCubit.get(context).userLogin(
                                        email: emailController.text,
                                        password: passwordController.text);
                                        state is LoginSuccessState;

                                } catch (e) {
                                  showMessage(message: e.toString(),color: Colors.red);
                                }
                              }
                            }),
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
                                moveToPage(context: context,pageName: RegisterPage.id);
                              },
                              child: Text('Sign up', style: textStyle))
                        ],
                      )
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
