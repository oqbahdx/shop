import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/screens/home.dart';
import 'package:shop/state_management/states.dart';
import 'package:shop/utils/network.dart';
import 'package:shop/widgets/widgets.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  void postData({
    @required String email,
    @required String password,
  }) {
    emit(ShopLoadingState());
    HttpHelper.userLogin(body: {'email': email, 'password': password})
        .then((value) {
      print(value);
      emit(ShopSuccessState());
    }).catchError((err) {
      print("err " + err.toString());

      emit(ShopErrorState(err.toString()));
    });
  }

  IconData icon = Icons.visibility_off_outlined;
  bool isVisible = true;

  void changeIconVisibility() {
    isVisible = !isVisible;
    icon = isVisible
        ? Icons.visibility_off_outlined
        : Icons.visibility;


    emit(ShopChangeVisibilityState());
  }
}
