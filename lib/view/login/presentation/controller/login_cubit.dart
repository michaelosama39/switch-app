import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:switch_app/core/models/user_model.dart';
import 'package:switch_app/view/login/domain/usecases/login.dart';

import '../../../../core/router/router.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../widgets/snackBar.dart';
import '../../../bottomNav/presentation/screens/bottom_nav_screen.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final Login loginUseCase;

  LoginCubit(this.loginUseCase) : super(LoginState());

  static LoginCubit of(context) => BlocProvider.of(context);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future login() async {
    emit(LoginState(
      loginState: RequestState.loading,
    ));
    final res = await loginUseCase.execute(
        emailController.text, passwordController.text);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(LoginState(
          message: err.message,
          loginState: RequestState.error,
        ));
      },
      (res) async {
        emit(LoginState(
          userModel: res,
          loginState: RequestState.loaded,
        ));
        MagicRouter.navigateAndPopAll(BottomNavScreen());
      },
    );
  }
}
