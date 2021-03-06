import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/screens/home_screens/categories.dart';
import 'package:shop/screens/home_screens/favorite.dart';
import 'package:shop/screens/home_screens/products.dart';
import 'package:shop/screens/home_screens/settings.dart';
import 'package:shop/state_management/states.dart';
import 'package:shop/utils/categories_model.dart';
import 'package:shop/utils/change_favorite_model.dart';
import 'package:shop/utils/favorite_model.dart';
import 'package:shop/utils/home_model.dart';
import 'package:shop/utils/login_model.dart';
import 'package:shop/utils/network.dart';
import 'package:shop/utils/register_model.dart';

import 'package:shop/utils/shared_prefrences.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());
  LoginModel model;
  HomeModel homeModel;
  CategoriesModel cateModel;
  RegisterModel rModel;
  Map<int, bool> favorite = {};
  ChangeFavoriteModel changeFavoriteModel;
  FavoritesModel favoriteModel;

  static ShopCubit get(context) => BlocProvider.of(context);

  void getHomeData() {
    emit(ShopLoadingDataState());
    HttpHelper.getHttpData().then((value) {
      homeModel = HomeModel.fromJson(value);

      homeModel.data.products.forEach((element) {
        favorite.addAll({element.id: element.inFavorites});
      });
      print(token);
      // print(favorite.toString());
      emit(ShopSuccessDataState());
    }).catchError((err) {
      print("err : " + err.toString());
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

  void getCategory() {
    emit(ShopLoadingCategoryState());
    HttpHelper.getCategories().then((value) {
      cateModel = CategoriesModel.fromJson(value);
      // print(cateModel.status.toString());
      // print(cateModel.data.data.toString());
      emit(ShopSuccessCategoryState());
    }).catchError((err) {
      emit(ShopErrorCategoryState(err.toString()));
      print(err.toString());
    });
  }

  void changeFavorite(int productId) async {
    favorite[productId] = !favorite[productId];
    emit(ShopChangeFavoriteState());
    HttpHelper.getFavorite(productId).then((value) {
      changeFavoriteModel = ChangeFavoriteModel.fromJson(value);
      print(changeFavoriteModel.message);
      if (!favoriteModel.status) {
        favorite[productId] = !favorite[productId];
      } else {
        getAllFavorites();
      }
      emit(ShopSuccessGetFavoriteState(changeFavoriteModel));
    }).catchError((err) {
      emit(ShopErrorGetFavoriteState(err.toString()));
    });
  }

  void getAllFavorites() {
    emit(ShopLoadingGetAllFavorites());
    HttpHelper.getAllFavorite().then((value) {
      favoriteModel = FavoritesModel.fromJson(value);
      print(favoriteModel.data.data[0].product.price);
      emit(ShopSuccessGetAllFavorites());
    }).catchError((err) {
      print(err.toString());
      emit(ShopErrorGetAllFavorites(err.toString()));
    });
  }

  void getUserProfile() {
    emit(ShopLoadingProfileState());
    HttpHelper.getProfile().then((value) {
      model = LoginModel.fromJson(value);
      print(model.data.name);
      emit(ShopSuccessProfileState(model));
    }).catchError((err) {
      print(err.toString());
      emit(ShopErrorProfileState(err.toString()));
    });
  }

  void updateUserProfile(
      {String name, String email, String phone, String image}) {
    HttpHelper.userDioUpdateProfile(url: 'update-profile', data: {
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
    }).then((value) {
      model = LoginModel.fromJson(value.data);
      emit(ShopSuccessUpdateProfileState());
    }).catchError((error) {
      emit(ShopErrorUpdateProfileState(error));
    });
  }

  void updateProfileWithImage(
      {String name, String email, String phone, var image}) {
    HttpHelper.updateProfileWithImage(
            name: name, email: email, phone: phone, image: image)
        .then((value) {
      model = LoginModel.fromJson(value.data);
      print(model.status);
      emit(ShopSuccessUpdateProfileState());
    }).catchError((error) {
      print(error);
      emit(ShopErrorUpdateProfileState(error));
    });
  }

  void postUpdateData({
    String email,
    String name,
    String phone,
    dynamic image,
  }) {
    emit(ShopLoadingProfileState());
    HttpHelper.userDioUpdate(url: 'update-profile', data: {
      'email': email,
      'name': name,
      'phone': phone,
      'image': image
    }).then((value) {
      model = LoginModel.fromJson(value.data);
      emit(ShopSuccessProfileState(model));
    }).catchError((err) {
      emit(ShopErrorProfileState(err.toString()));
    });
  }

  void registerUser(
      {String name, String email, String password, String phone}) {
    emit(ShopLoadingRegisterState());
    HttpHelper.userDioRegister(url: 'register', data: {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone
    }).then((value) {
      rModel = RegisterModel.fromJson(value.data);
      print(rModel.status);
      print(value);
      emit(ShopSuccessRegisterState(rModel));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorRegisterState(error.toString()));
    });
  }
}
