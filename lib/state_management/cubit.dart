import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/screens/home_screens/categories.dart';
import 'package:shop/screens/home_screens/favorite.dart';
import 'package:shop/screens/home_screens/products.dart';
import 'package:shop/screens/home_screens/settings.dart';
import 'package:shop/state_management/states.dart';
import 'package:shop/utils/home_model.dart';
import 'package:shop/utils/login_model.dart';
import 'package:shop/utils/network.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());
  LoginModel model;
  HomeModel homeModel;

  static ShopCubit get(context) => BlocProvider.of(context);

  void getHomeData()  {
    emit(ShopLoadingDataState());
    HttpHelper.getHttpData().then((value){
      homeModel = HomeModel.fromJson(value);
      print(homeModel.data);
      emit(ShopSuccessDataState());
    }).catchError((err){
      print("err : "+ err.toString());
      print(err);
      emit(ShopErrorDataState(err.toString()));
    });
  }

  void postData({
    @required String email,
    @required String password,
  }) {
    emit(ShopLoadingState());
    HttpHelper.userDioLogin(
        url: 'login',
        data: {'email': email, 'password': password}).then((value) {
      model = LoginModel.fromJson(value.data);
      emit(ShopSuccessState(model));
    }).catchError((err) {
      emit(ShopErrorState(err.toString()));
    });
  }

  IconData icon = Icons.visibility_off_outlined;
  bool isVisible = true;

  void changeIconVisibility() {
    isVisible = !isVisible;
    icon = isVisible ? Icons.visibility_off_outlined : Icons.visibility;

    emit(ShopChangeVisibilityState());
  }

  int currentIndex = 0;
  List<Widget> bottomScreens = [
    ProductsPage(),
    Categories(),
    Favorite(),
    Settings(),
  ];

  void changeCurrentIndex(int index) {
    currentIndex = index;
    if (bottomScreens.length <= 3) currentIndex++;
    emit(ShopChangeCurrentIndexState());
  }
}
