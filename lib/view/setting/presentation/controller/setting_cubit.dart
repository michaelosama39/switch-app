import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:switch_app/core/models/msg_model.dart';
import 'package:switch_app/view/login/presentation/screens/login_screen.dart';
import 'package:switch_app/view/setting/data/model/media_model.dart';
import 'package:switch_app/view/setting/domain/usecases/delete_account.dart';
import 'package:switch_app/view/setting/domain/usecases/logout.dart';
import '../../../../core/appStorage/app_storage.dart';
import '../../../../core/router/router.dart';
import '../../../../widgets/snackBar.dart';
import '../../domain/usecases/get_media.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit(
      this.logoutUseCase, this.deleteAccountUseCase, this.getMediaUseCase)
      : super(SettingInitial());

  static SettingCubit of(context) => BlocProvider.of(context);

  final Logout logoutUseCase;
  final DeleteAccount deleteAccountUseCase;
  final GetMedia getMediaUseCase;

  MediaData? mediaData;

  Future getMedia() async {
    emit(GetMediaLoading());
    final res = await getMediaUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(SettingInitial());
      },
      (res) async {
        mediaData = res.data;
        emit(SettingInitial());
      },
    );
  }

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
