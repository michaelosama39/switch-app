part of 'register_cubit.dart';

class RegisterState {
  final UserModel? userModel;
  final RequestState registerState;
  final String message;

  RegisterState({
    this.userModel,
    this.registerState = RequestState.initial,
    this.message = '',
  });
}
