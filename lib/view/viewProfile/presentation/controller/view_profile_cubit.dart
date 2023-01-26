import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:switch_app/view/viewProfile/data/model/app_details_model.dart';
import 'package:switch_app/view/viewProfile/domain/usecases/show_app_details.dart';

import '../../../../widgets/snackBar.dart';

part 'view_profile_state.dart';

class ViewProfileCubit extends Cubit<ViewProfileState> {
  ViewProfileCubit(this.showAppDetailsUseCase) : super(ViewProfileInitial());

  static ViewProfileCubit of(context) => BlocProvider.of(context);

  final ShowAppDetails showAppDetailsUseCase;
  List<AppDetailsData> listOfAppDetailsData = [];

  Future showAppDetails() async {
    emit(ShowAppDetailsSocialLoading());
    final res = await showAppDetailsUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(ViewProfileInitial());
      },
      (res) async {
        listOfAppDetailsData.addAll(res.accounts!);
        emit(ViewProfileLoaded());
      },
    );
  }

  // Future showAppDetailsCreative() async {
  //   emit(ShowAppDetailsCreativeLoading());
  //   final res = await showAppDetailsUseCase.execute('creative');
  //   res.fold(
  //     (err) {
  //       showSnackBar(err.message);
  //       emit(ViewProfileInitial());
  //     },
  //     (res) async {
  //       listOfAppDetailsDataSocial.addAll(res.accounts!);
  //       emit(ViewProfileInitial());
  //     },
  //   );
  // }
  //
  // Future showAppDetailsMusic() async {
  //   emit(ShowAppDetailsMusicLoading());
  //   final res = await showAppDetailsUseCase.execute('music');
  //   res.fold(
  //     (err) {
  //       showSnackBar(err.message);
  //       emit(ViewProfileInitial());
  //     },
  //     (res) async {
  //       listOfAppDetailsDataSocial.addAll(res.accounts!);
  //       emit(ViewProfileInitial());
  //     },
  //   );
  // }
  //
  // Future showAppDetailsBusiness() async {
  //   emit(ShowAppDetailsBusinessLoading());
  //   final res = await showAppDetailsUseCase.execute('business');
  //   res.fold(
  //     (err) {
  //       showSnackBar(err.message);
  //       emit(ViewProfileInitial());
  //     },
  //     (res) async {
  //       listOfAppDetailsDataSocial.addAll(res.accounts!);
  //       emit(ViewProfileInitial());
  //     },
  //   );
  // }
}
