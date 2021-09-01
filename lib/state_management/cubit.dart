import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/state_management/states.dart';
import 'package:shop/utils/network.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  LoginCubit get(context) => BlocProvider.of(context);
  
  void userLogin({
  @required String email,
    @required String password
}){
    DioUrl.postData(url: LOGIN, query: {
      'email':email,
      'password':password
    }).then((value){
      print(value.data);
      emit(LoginSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });

  }
}



