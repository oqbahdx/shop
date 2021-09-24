import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/state_management/cubit.dart';
import 'package:shop/state_management/states.dart';
import 'package:shop/styles/text.dart';

class Favorite extends StatefulWidget {
  static String id = 'Favorite';

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) => ListTile( )),
        );
      },
    );
  }
}
