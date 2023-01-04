part of 'login_cubit.dart';

class LoginState {
  final UserModel? userModel;
  final RequestState loginState;
  final String message;

  LoginState({
    this.userModel,
    this.loginState = RequestState.initial,
    this.message = '',
  });
}
