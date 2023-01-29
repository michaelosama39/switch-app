import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:switch_app/core/models/user_model.dart';
import 'package:switch_app/core/utils/app_func.dart';
import 'package:switch_app/view/login/domain/usecases/login.dart';

import '../../../../core/appStorage/app_storage.dart';
import '../../../../core/router/router.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../widgets/snackBar.dart';
import '../../../bottomNav/presentation/screens/bottom_nav_screen.dart';
import '../../../../core/models/user_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(LoginState());

  final Login loginUseCase;

  static LoginCubit of(context) => BlocProvider.of(context);
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future login() async {
    if (formKey.currentState!.validate() == true) {
      emit(LoginState(
        loginState: RequestState.loading,
      ));
      final res = await loginUseCase.execute(
        emailController.text,
        passwordController.text,
        await AppFunc.getTokenDevice(),
      );
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
            loginModel: res,
            loginState: RequestState.loaded,
          ));
          await AppStorage.cacheUserInfo(res);
          await AppStorage.cachePasswordUserInfo(passwordController.text);
          await AppStorage.cacheToken(res.token!);
          MagicRouter.navigateAndPopAll(BottomNavScreen());
        },
      );
    }
  }
}
