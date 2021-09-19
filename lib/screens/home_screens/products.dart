import 'package:flutter/material.dart';
import 'package:shop/styles/text.dart';


class ProductsPage extends StatefulWidget {
  static String id = 'ProductsPage';


  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('ProductsPage',style: titleStyle,),
      ),
    );
  }
}
