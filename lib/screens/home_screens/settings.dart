import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/screens/login.dart';
import 'package:shop/state_management/cubit.dart';
import 'package:shop/state_management/states.dart';
import 'package:shop/utils/shared_prefrences.dart';

import 'package:shop/widgets/buttons.dart';
import 'package:shop/widgets/widgets.dart';

class Settings extends StatefulWidget {
  static String id = 'Settings';

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = ShopCubit.get(context).model;
        nameController.text = model.data.name;
        emailController.text = model.data.email;
        phoneController.text = model.data.phone;
        return ConditionalBuilder(
          condition: ShopCubit.get(context).homeModel != null,
          builder: (context) => Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                margin: EdgeInsets.only(top: 70),
                child: Column(
                  children: [
                    defaultTextFormField(
                        text: 'Name',
                        icn: Icons.person,
                        type: TextInputType.text,
                        controller: nameController),
                    SizedBox(
                      height: 25,
                    ),
                    defaultTextFormField(
                        text: 'Email',
                        icn: Icons.email,
                        type: TextInputType.emailAddress,
                        controller: emailController),
                    SizedBox(
                      height: 25,
                    ),
                    defaultTextFormField(
                        text: 'Phone',
                        icn: Icons.phone,
                        type: TextInputType.phone,
                        controller: phoneController),
                    SizedBox(
                      height: 150,
                    ),
                    defaultSubmitButton(
                        text: 'LOG OUT',
                        color: Colors.red,
                        height: 250,
                        onPress: () {
                          Shared.removeData(key: 'token');
                          moveToPage(context: context, pageName: LoginPage.id);
                        })
                  ],
                ),
              )),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
