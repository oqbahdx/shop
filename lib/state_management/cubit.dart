
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/state_management/states.dart';
import 'package:shop/utils/network.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

 static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({@required String email, @required String password}) async{
    emit(LoginLoadingState());
  await  HttpHelper.postData(email: email, password: password, url:HttpHelper.LOGIN);

  }

  Future<Response> registerUser({
  @required String name,
    @required String email,
    @required String password,
    @required String phone,
})async{
    emit(RegisterLoadingState());
  //   DioUrl.dio.post(REGISTER,data: {
  //     'name':name,
  //     'email':email,
  //     'password':password,
  //     'phone':phone
  //   }).then((value){
  //     print(value.data['message']);
  //     emit(RegisterSuccessState());
  //   }).then((error){
  //     print(error);
  //     emit(RegisterErrorState(error.toString()));
  //   });
   }
}
