import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:switch_app/view/viewProfile/domain/usecases/get_user_data.dart';

import '../../../../core/models/user_data_model.dart';
import '../../../../widgets/snackBar.dart';

part 'view_profile_state.dart';

class ViewProfileCubit extends Cubit<ViewProfileState> {
  ViewProfileCubit(this.getUserDataUseCase) : super(ViewProfileInitial());

  static ViewProfileCubit of(context) => BlocProvider.of(context);

  final GetUserData getUserDataUseCase;

  UserDataModel? userData;

  Future getUserData() async {
    emit(GetUserDataLoading());
    final res = await getUserDataUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(ViewProfileInitial());
      },
      (res) {
        userData = res;
        emit(ViewProfileInitial());
      },
    );
  }
}
