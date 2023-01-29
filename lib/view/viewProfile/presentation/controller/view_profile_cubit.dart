import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/view/bottomNav/presentation/screens/bottom_nav_screen.dart';
import 'package:switch_app/view/viewProfile/data/model/app_details_model.dart';
import 'package:switch_app/view/viewProfile/domain/usecases/change_status_app.dart';
import 'package:switch_app/view/viewProfile/domain/usecases/edit_app_details.dart';
import 'package:switch_app/view/viewProfile/domain/usecases/show_app_details.dart';

import '../../../../widgets/snackBar.dart';

part 'view_profile_state.dart';

class ViewProfileCubit extends Cubit<ViewProfileState> {
  ViewProfileCubit(this.showAppDetailsUseCase, this.editAppDetailsUseCase,
      this.changeStatusAppUseCase)
      : super(ViewProfileInitial());

  static ViewProfileCubit of(context) => BlocProvider.of(context);

  final ShowAppDetails showAppDetailsUseCase;
  final EditAppDetails editAppDetailsUseCase;
  final ChangeStatusApp changeStatusAppUseCase;
  List<AppDetailsData> listOfAppDetailsData = [];

  Future showAppDetails() async {
    emit(ShowAppDetailsLoading());
    final res = await showAppDetailsUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(ViewProfileInitial());
      },
      (res) async {
        listOfAppDetailsData.addAll(res.accounts!);
        emit(ShowAppDetailsLoaded());
      },
    );
  }

  Future editAppDetails(int appId, String title, String url) async {
    emit(EditAppDetailsLoading());
    final res = await editAppDetailsUseCase.execute(appId, title, url);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(ViewProfileInitial());
      },
      (res) async {
        emit(ViewProfileInitial());
        MagicRouter.navigateAndPopAll(BottomNavScreen());
        showSnackBar(res.message!);
      },
    );
  }

  Future changeStatusApp(int appId, bool status) async {
    final res = await changeStatusAppUseCase.execute(appId, status);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(ViewProfileInitial());
      },
      (res) async {
        emit(ViewProfileInitial());
      },
    );
  }
}
