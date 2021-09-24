import 'package:shop/utils/change_favorite_model.dart';
import 'package:shop/utils/login_model.dart';

abstract class ShopStates {}
class ShopInitialState extends ShopStates{}
class ShopLoadingState extends ShopStates{}
class ShopSuccessState extends ShopStates{
  final LoginModel loginModel;

  ShopSuccessState(this.loginModel);
}
class ShopErrorState extends ShopStates {
  final String error;
  ShopErrorState(this.error);
}
class ShopChangeVisibilityState extends ShopStates{}
class ShopChangeCurrentIndexState extends ShopStates{}

class ShopLoadingDataState extends ShopStates{}
class ShopSuccessDataState extends ShopStates{}
class ShopErrorDataState extends ShopStates{
  final String error;

  ShopErrorDataState(this.error);
}

class ShopLoadingCategoryState extends ShopStates{}
class ShopSuccessCategoryState extends ShopStates{}

class ShopErrorCategoryState extends ShopStates{
  final String error;

  ShopErrorCategoryState(this.error);
}
class ShopSuccessGetFavoriteState extends ShopStates{
  final ChangeFavoriteModel model;

  ShopSuccessGetFavoriteState(this.model);
}
class ShopGetFavoriteState extends ShopStates{}
class ShopErrorGetFavoriteState extends ShopStates{
  final String error;

  ShopErrorGetFavoriteState(this.error);
}

class ShopSuccessGetAllFavorites extends ShopStates{}
class ShopErrorGetAllFavorites extends ShopStates{
  final String error;

  ShopErrorGetAllFavorites(this.error);
}