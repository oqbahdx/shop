import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop/state_management/cubit.dart';
import 'package:shop/styles/text.dart';
import 'package:shop/widgets/buttons.dart';
import 'dart:io';

class UpdateImageProfile extends StatefulWidget {
  static String id = 'UpdateImageProfile';

  @override
  _UpdateImageProfileState createState() => _UpdateImageProfileState();
}

class _UpdateImageProfileState extends State<UpdateImageProfile> {
  File _image;
  final picker = ImagePicker();

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
    var model = ShopCubit.get(context).model;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 100),
            ),
            Container(
              alignment: Alignment.center,
              height: 250,
              width: 250,
              child: _image == null
                  ? Image(
                image: NetworkImage(model.data.image),
              )
                  : Image.file(
                _image,
                fit: BoxFit.fill,
              ),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            SizedBox(
              height: 150,
            ),
            defaultSubmitButton(
                text: 'SELECT PROFILE IMAGE',
                color: Colors.green,
                onPress: () {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => Center(
                            child: Container(
                              height: 272,
                              width: 260,
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    'SELECT IMAGE',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Opti'),
                                  ),
                                  Divider(
                                    thickness: 2,
                                    color: Colors.white,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
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
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [
                                              Colors.red,
                                              Colors.green,
                                            ],
                                            end: Alignment.centerLeft,
                                            begin: Alignment.centerRight),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
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
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [
                                              Colors.red,
                                              Colors.green,
                                            ],
                                            end: Alignment.centerLeft,
                                            begin: Alignment.centerRight),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 2,
                                    color: Colors.white,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          'ok',
                                          style: titleStyle,
                                        ),
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.green)),
                                      )),
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            'cancel',
                                            style: titleStyle,
                                          ),
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
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
                }),
          ],
        ),
      ),
    );
  }
}
