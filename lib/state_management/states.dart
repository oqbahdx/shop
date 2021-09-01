abstract class LoginState {}
abstract class RegisterState{}
class LoginInitialState extends LoginState{}
class LoginLoadingState extends LoginState{}
class LoginSuccessState extends LoginState{}
class LoginErrorState extends LoginState {
  final String error;
  LoginErrorState(this.error);
}

class RegisterInitialState extends RegisterState{}
class RegisterLoadingState extends RegisterState{}
class RegisterSuccessState extends RegisterState{}
class RegisterErrorState extends RegisterState {
  final String error;
  RegisterErrorState(this.error);
}