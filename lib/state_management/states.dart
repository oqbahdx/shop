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
