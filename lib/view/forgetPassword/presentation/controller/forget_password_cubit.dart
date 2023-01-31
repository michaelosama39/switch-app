import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:switch_app/view/forgetPassword/domain/usecases/forget_password.dart';
import 'package:switch_app/view/forgetPassword/domain/usecases/reset_password.dart';
import 'package:switch_app/view/forgetPassword/domain/usecases/verfication_code.dart';

import '../../../../core/router/router.dart';
import '../../../../widgets/snackBar.dart';
import '../../../login/presentation/screens/login_screen.dart';
import '../screens/reset_password_screen.dart';
import '../screens/verfication_code_screen.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.forgetPasswordUseCase, this.verficationCodeUseCase,
      this.resetPasswordUseCase)
      : super(ForgetPasswordInitial());

  static ForgetPasswordCubit of(context) => BlocProvider.of(context);

  final ForgetPassword forgetPasswordUseCase;
  final VerficationCode verficationCodeUseCase;
  final ResetPassword resetPasswordUseCase;

  final emailController = TextEditingController();
  final codeController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  Future forgetPassword() async {
    emit(ForgetPasswordLoading());
    final res = await forgetPasswordUseCase.execute(emailController.text);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(ForgetPasswordInitial());
      },
      (res) async {
        showSnackBar(res.message!);
        MagicRouter.navigateTo(VerficationCodeScreen());
        emit(ForgetPasswordInitial());
      },
    );
  }

  Future verficationCode() async {
    emit(VerficationCodeLoading());
    final res = await verficationCodeUseCase.execute(
        emailController.text, codeController.text);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(ForgetPasswordInitial());
      },
      (res) async {
        showSnackBar(res.message!);
        MagicRouter.navigateTo(ResetPasswordScreen());
        emit(ForgetPasswordInitial());
      },
    );
  }

  Future resetPassword() async {
    emit(VerficationCodeLoading());
    final res = await resetPasswordUseCase.execute(emailController.text,
        passwordController.text, passwordConfirmationController.text);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(ForgetPasswordInitial());
      },
      (res) async {
        showSnackBar(res.message!);
        MagicRouter.navigateAndPopAll(LoginScreen());
        emit(ForgetPasswordInitial());
      },
    );
  }
}
