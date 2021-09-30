import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop/screens/login.dart';
import 'package:shop/state_management/cubit.dart';
import 'package:shop/state_management/states.dart';
import 'package:shop/styles/text.dart';
import 'package:shop/utils/shared_prefrences.dart';
import 'dart:io';
import 'package:shop/widgets/buttons.dart';
import 'package:shop/widgets/widgets.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class Settings extends StatefulWidget {
  static String id = 'Settings';

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  File _image;
  final picker = ImagePicker();
  Dio dio;
  String filename;

  Future getImage(ImageSource src) async {
    final pickedFile = await picker.getImage(
        source: src, imageQuality: 100, maxHeight: 300, maxWidth: 300);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

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
              body: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      if(state is ShopLoadingProfileState)
                        LinearProgressIndicator(),
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                              height: 150,
                              width: 150,
                              child: _image == null
                                  ? Container(
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Image(
                                        image: NetworkImage(model.data.image),
                                      ),
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Container(
                                        height: 150,
                                        width: 150,
                                        child: Image.file(
                                          _image,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                          Positioned(
                              right: 0,
                              bottom: 0,
                              child: IconButton(
                                  onPressed: () {
                                    showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) => Center(
                                              child: Container(
                                                height: 272,
                                                width: 260,
                                                decoration: BoxDecoration(
                                                  color: Colors.black54,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(25),
                                                    topRight:
                                                        Radius.circular(25),
                                                  ),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      'SELECT IMAGE',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'Opti'),
                                                    ),
                                                    Divider(
                                                      thickness: 2,
                                                      color: Colors.white,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        getImage(
                                                            ImageSource.camera);
                                                      },
                                                      child: Container(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Icon(
                                                              Icons.camera_alt,
                                                              size: 55,
                                                            ),
                                                            Text(
                                                              'CAMERA',
                                                              style: titleStyle,
                                                            )
                                                          ],
                                                        ),
                                                        height: 70,
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          gradient: LinearGradient(
                                                              colors: [
                                                                Colors.red,
                                                                Colors.green,
                                                              ],
                                                              end: Alignment
                                                                  .centerLeft,
                                                              begin: Alignment
                                                                  .centerRight),
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 1,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        getImage(ImageSource
                                                            .gallery);
                                                      },
                                                      child: Container(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Icon(
                                                              Icons.image,
                                                              size: 55,
                                                            ),
                                                            Text(
                                                              'GALLERY',
                                                              style: titleStyle,
                                                            )
                                                          ],
                                                        ),
                                                        height: 70,
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          gradient: LinearGradient(
                                                              colors: [
                                                                Colors.red,
                                                                Colors.green,
                                                              ],
                                                              end: Alignment
                                                                  .centerLeft,
                                                              begin: Alignment
                                                                  .centerRight),
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 2,
                                                      color: Colors.white,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                            child:
                                                                ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text(
                                                            'ok',
                                                            style: titleStyle,
                                                          ),
                                                          style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty.all<
                                                                          Color>(
                                                                      Colors
                                                                          .green)),
                                                        )),
                                                        Expanded(
                                                          child: ElevatedButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                              setState(() {
                                                                _image = null;
                                                              });
                                                            },
                                                            child: Text(
                                                              'cancel',
                                                              style: titleStyle,
                                                            ),
                                                            style: ButtonStyle(
                                                                backgroundColor:
                                                                    MaterialStateProperty
                                                                        .all<
                                                                            Color>(
                                                              Colors.red,
                                                            )),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ));
                                  },
                                  icon: Icon(Icons.edit))),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
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
                        height: 100,
                      ),
                      defaultSubmitButton(
                          text: 'UPDATE',
                          color: Colors.green,
                          height: 250,
                          onPress: () async {
                           try{
                             ShopCubit.get(context).postUpdateData(
                                 image: await MultipartFile.fromFile(
                                   _image.path,
                                   filename: filename,
                                   contentType: MediaType('image', 'jpg'),
                                 ),
                                 email: emailController.text,
                                 phone: phoneController.text,
                                 name: nameController.text);
                           }catch(e){
                             print(e);
                           }
                          }),
                      SizedBox(
                        height: 30,
                      ),
                      defaultSubmitButton(
                          text: 'LOG OUT',
                          color: Colors.red,
                          height: 250,
                          onPress: () {
                            Shared.removeData(key: 'token');
                            moveToPage(
                                context: context, pageName: LoginPage.id);
                          })
                    ],
                  ),
                ),
              )),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
