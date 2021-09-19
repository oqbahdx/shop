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
      appBar: AppBar(),
      body: Center(
        child: Text('SEARCH',style: titleStyle,),
      ),
    );
  }
}
