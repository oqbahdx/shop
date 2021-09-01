import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/state_management/states.dart';
import 'package:shop/utils/network.dart';

class RegisterCubit extends Cubit<RegisterState>{
  RegisterCubit() :super(RegisterInitialState());

 static RegisterCubit get(context)=>BlocProvider.of(context);

  void registerUser({

    @required String name,
    @required String email,
    @required String password,
    @required String phone, Map<String,dynamic>data
  })async{
    emit(RegisterLoadingState());
    return await DioUrl.dio.post(REGISTER,data: {
      'name':name,
      'email':email,
      'password':password,
      'phone':phone
    }).then((value){
      emit(RegisterSuccessState());
      print(value.data);
    }).catchError((error){
      print(error);
      emit(RegisterErrorState(error.toString()));
    });

  }
}