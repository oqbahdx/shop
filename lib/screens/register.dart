import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/state_management/cubit.dart';
import 'package:shop/state_management/register_cubit.dart';
import 'package:shop/state_management/states.dart';
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
  var formKey = GlobalKey<FormState>();

  @override
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
                'Register',
                style: titleStyle,
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    sBox(height: hM * 0.05),
                    defaultTextFormField(
                        text: 'Name',
                        icn: Icons.person,
                        controller: nameController,
                        type: TextInputType.name,
                        function: (String value) {
                          if (value.isEmpty) return 'Enter the name';
                        }),
                    sBox(height: hM * 0.05),
                    defaultTextFormField(
                        text: 'Email',
                        icn: Icons.email,
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        function: (String value) {
                          if (value.isEmpty) return 'Enter the email';
                        }),
                    sBox(height: hM * 0.05),
                    defaultTextFormField(
                        text: 'Password',
                        icn: Icons.enhanced_encryption,
                        controller: passwordController,
                        sec: hidePassword,
                        type: TextInputType.text,
                        function: (String value) {
                          if (value.isEmpty) return 'Enter the password';
                        },
                        showPass: IconButton(
                            icon: Icon(hidePassword
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            })),
                    sBox(height: hM * 0.05),
                    defaultTextFormField(
                        text: 'Phone',
                        icn: Icons.person,
                        controller: phoneController,
                        type: TextInputType.phone,
                        function: (String value) {
                          if (value.isEmpty) return 'Enter the phone number';
                        }),
                    sBox(height: hM * 0.15),
                    ConditionalBuilder(
                      condition: true,
                      builder: (context) => defaultSubmitButton(
                          text: 'Register',
                          onPress: () {
                            if (formKey.currentState.validate()) {
                              RegisterCubit.get(context).registerUser(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                phone: phoneController.text,
                              );
                            } else {
                              showMessage(
                                  message: 'Something went wrong',
                                  color: Colors.red);
                            }
                          }),
                      fallback: (context) => CircularProgressIndicator(),
                    ),
                    sBox(height: hM * 0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t you have an account ? ',
                          style: textStyle,
                        ),
                        TextButton(
                            onPressed: () {
                              moveToPage(context, LoginPage.id);
                            },
                            child: Text('Sign in', style: textStyle))
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
