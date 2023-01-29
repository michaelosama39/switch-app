import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../core/router/router.dart';
import '../../../../widgets/snackBar.dart';
import '../../../bottomNav/presentation/screens/bottom_nav_screen.dart';
import '../../../Profile/data/model/app_details_model.dart';
import '../../domain/usecases/change_status_app.dart';
import '../../domain/usecases/edit_app_details.dart';
import '../../domain/usecases/show_app_details.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.showAppDetailsUseCase, this.editAppDetailsUseCase,
      this.changeStatusAppUseCase)
      : super(ProfileInitial());

  static ProfileCubit of(context) => BlocProvider.of(context);

  bool isDircect = false;
  List<AppDetailsData> listOfAllApps = [];
  final accountNameController = TextEditingController();
  final accountUrlController = TextEditingController();

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
        emit(ProfileInitial());
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
        emit(ProfileInitial());
      },
      (res) async {
        emit(ProfileInitial());
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
        emit(ProfileInitial());
      },
      (res) async {
        emit(ProfileInitial());
      },
    );
  }

  editLink(AppDetailsData applicationsData) {
    accountNameController.text = applicationsData.pageTitle!;
    accountUrlController.text = applicationsData.url!;
  }

  changeSelectedDircect() {
    isDircect = !isDircect;
    emit(ChangeSelectedDircectState());
  }
}
