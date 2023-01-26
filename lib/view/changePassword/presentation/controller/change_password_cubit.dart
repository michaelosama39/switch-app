import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/view/changePassword/domain/usecases/change_password.dart';

import '../../../../widgets/snackBar.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this.changePasswordUseCase)
      : super(ChangePasswordInitial());

  static ChangePasswordCubit of(context) => BlocProvider.of(context);

  final ChangePassword changePasswordUseCase;

  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final newPassword = TextEditingController();
  final newConfirmPassword = TextEditingController();

  Future changePassword() async {
    if(formKey.currentState!.validate() == true){
      emit(ChangePasswordLoading());
      final res = await changePasswordUseCase.execute(
        passwordController.text,
        newPassword.text,
        newConfirmPassword.text,
      );
      res.fold(
            (err) {
          showSnackBar(err.message);
          emit(ChangePasswordInitial());
        },
            (res) async {
          showSnackBar(res.message!);
          MagicRouter.pop();
          emit(ChangePasswordInitial());
        },
      );
    }
  }
}
