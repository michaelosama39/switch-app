import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:switch_app/core/models/msg_model.dart';
import 'package:switch_app/view/login/presentation/screens/login_screen.dart';
import 'package:switch_app/view/setting/domain/usecases/logout.dart';
import '../../../../core/appStorage/app_storage.dart';
import '../../../../core/router/router.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../widgets/snackBar.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit(this.logoutUseCase) : super(SettingInitial());

  static SettingCubit of(context) => BlocProvider.of(context);

  final Logout logoutUseCase;

  Future logout() async {
    emit(LogoutState(
      logoutState: RequestState.loading,
    ));
    final res = await logoutUseCase.execute();
    res.fold(
          (err) {
        showSnackBar(err.message);
        emit(LogoutState(
          message: err.message,
          logoutState: RequestState.error,
        ));
      },
          (res) async {
        emit(LogoutState(
          message: res.message!,
          msgModel: res,
          logoutState: RequestState.loaded,
        ));
        await AppStorage.signOut();
        MagicRouter.navigateAndPopAll(LoginScreen());
      },
    );
  }
}
