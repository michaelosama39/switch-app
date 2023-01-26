import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:switch_app/core/models/msg_model.dart';
import 'package:switch_app/view/login/presentation/screens/login_screen.dart';
import 'package:switch_app/view/setting/domain/usecases/delete_account.dart';
import 'package:switch_app/view/setting/domain/usecases/logout.dart';
import '../../../../core/appStorage/app_storage.dart';
import '../../../../core/router/router.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../widgets/snackBar.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit(this.logoutUseCase, this.deleteAccountUseCase)
      : super(SettingInitial());

  static SettingCubit of(context) => BlocProvider.of(context);

  final Logout logoutUseCase;
  final DeleteAccount deleteAccountUseCase;

  Future logout() async {
    emit(LogoutLoading());
    final res = await logoutUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(SettingInitial());
      },
      (res) async {
        emit(LogoutLoading());
        await AppStorage.signOut();
        MagicRouter.navigateAndPopAll(LoginScreen());
      },
    );
  }

  Future deleteAccount() async {
    emit(DeleteAccountLoading());
    final res = await deleteAccountUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(SettingInitial());
      },
      (res) async {
        emit(SettingInitial());
        await AppStorage.signOut();
        MagicRouter.navigateAndPopAll(LoginScreen());
        showSnackBar(res.message!);
      },
    );
  }
}
