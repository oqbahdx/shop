import 'package:shop/utils/change_favorite_model.dart';
import 'package:shop/utils/login_model.dart';
import 'package:shop/utils/register_model.dart';

abstract class ShopStates {}

class ShopInitialState extends ShopStates {}

class ShopLoadingState extends ShopStates {}

class ShopSuccessState extends ShopStates {
  final LoginModel loginModel;

  ShopSuccessState(this.loginModel);
}

class ShopErrorState extends ShopStates {
  final String error;

  ShopErrorState(this.error);
}

class ShopChangeVisibilityState extends ShopStates {}

class ShopChangeCurrentIndexState extends ShopStates {}

class ShopLoadingDataState extends ShopStates {}

class ShopSuccessDataState extends ShopStates {}

class ShopErrorDataState extends ShopStates {
  final String error;

  ShopErrorDataState(this.error);
}

class ShopLoadingCategoryState extends ShopStates {}

class ShopSuccessCategoryState extends ShopStates {}

class ShopErrorCategoryState extends ShopStates {
  final String error;

  ShopErrorCategoryState(this.error);
}

class ShopSuccessGetFavoriteState extends ShopStates {
  final ChangeFavoriteModel model;

  ShopSuccessGetFavoriteState(this.model);
}

class ShopGetFavoriteState extends ShopStates {}

class ShopErrorGetFavoriteState extends ShopStates {
  final String error;

  ShopErrorGetFavoriteState(this.error);
}

class ShopSuccessGetAllFavorites extends ShopStates {}

class ShopLoadingGetAllFavorites extends ShopStates {}

class ShopErrorGetAllFavorites extends ShopStates {
  final String error;

  ShopErrorGetAllFavorites(this.error);
}

class ShopChangeFavoriteState extends ShopStates {}

class ShopLoadingProfileState extends ShopStates {}

class ShopSuccessProfileState extends ShopStates {
  final LoginModel model;

  ShopSuccessProfileState(this.model);
}

class ShopErrorProfileState extends ShopStates {
  final String error;

  ShopErrorProfileState(this.error);
}

class ShopSuccessUpdateProfileState extends ShopStates {}
class ShopSuccessLoadingProfileState extends ShopStates {}

class ShopErrorUpdateProfileState extends ShopStates {
  final String error;

  ShopErrorUpdateProfileState(this.error);
}

class ShopLoadingRegisterState extends ShopStates {}

class ShopSuccessRegisterState extends ShopStates {
  final RegisterModel model;

  ShopSuccessRegisterState(this.model);
}

class ShopErrorRegisterState extends ShopStates {
  final String error;

  ShopErrorRegisterState(this.error);
}
