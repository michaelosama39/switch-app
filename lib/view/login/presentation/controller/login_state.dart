part of 'login_cubit.dart';

class LoginState {
  final UserModel? loginModel;
  final RequestState loginState;
  final String message;

  LoginState({
    this.loginModel,
    this.loginState = RequestState.initial,
    this.message = '',
  });
}
