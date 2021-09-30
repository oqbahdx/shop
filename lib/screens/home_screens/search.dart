import 'package:flutter/material.dart';
import 'package:shop/styles/text.dart';

class Search extends StatefulWidget {
  static String id = 'Search';

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back,color: Colors.black,))),
      body: Center(
        child: Text(
          'SEARCH',
          style: titleStyle,
        ),
      ),
    );
  }
}
