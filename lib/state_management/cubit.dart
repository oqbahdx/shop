
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/screens/home.dart';
import 'package:shop/state_management/states.dart';
import 'package:shop/utils/network.dart';
import 'package:shop/widgets/widgets.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

 static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({@required String email, @required String password}) {
    emit(LoginLoadingState());
    DioHelper.postData(url: 'login', data: {
      'email':email,
      'password':password
    }).then((value){
      print(value.data);
      emit(LoginSuccessState());
    }).catchError((err){
      print(err);
      emit(LoginErrorState(err.toString()));
    });

  }


  void userRegister({
  @required String name,@required String email,@required String password,@required String phone
})async{
    emit(LoginLoadingState());

    emit(LoginSuccessState());
  }

   }

