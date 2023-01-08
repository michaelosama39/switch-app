import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:switch_app/view/register/domain/usecases/register.dart';

import '../../../../core/models/user_model.dart';
import '../../../../core/router/router.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../widgets/snackBar.dart';
import '../../../bottomNav/presentation/screens/bottom_nav_screen.dart';
import '../../../login/presentation/screens/login_screen.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerUseCase) : super(RegisterState());

  final Register registerUseCase;

  static RegisterCubit of(context) => BlocProvider.of(context);
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final checkPasswordController = TextEditingController();

  Future register() async {
    if (formKey.currentState!.validate() == true) {
      emit(RegisterState(
        registerState: RequestState.loading,
      ));
      final res = await registerUseCase.execute(
        nameController.text,
        emailController.text,
        phoneController.text,
        passwordController.text,
      );
      res.fold(
        (err) {
          showSnackBar(err.message);
          emit(RegisterState(
            message: err.message,
            registerState: RequestState.error,
          ));
        },
        (res) async {
          emit(RegisterState(
            userModel: res,
            registerState: RequestState.loaded,
          ));
          MagicRouter.navigateAndPopAll(BottomNavScreen());
        },
      );
    }
  }
}
