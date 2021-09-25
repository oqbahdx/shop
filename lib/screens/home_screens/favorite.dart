import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class Favorite extends StatefulWidget {
  static String id = 'Favorite';

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.separated(
          separatorBuilder: (context, index) => Divider(),
          itemCount: 1,
          itemBuilder: (
            context,
            index,
          ) =>
              ListTile(

              )),
    );
  }
}
