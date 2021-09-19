import 'package:flutter/material.dart';
import 'package:shop/styles/text.dart';


class Products extends StatefulWidget {


  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('PRODUCTS',style: titleStyle,),
      ),
    );
  }
}
