import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:switch_app/core/models/user_model.dart';
import 'package:switch_app/view/editProfile/domain/usecases/edit_profile.dart';
import 'package:switch_app/view/editProfile/domain/usecases/get_profile.dart';

import '../../../../core/appStorage/app_storage.dart';
import '../../../../core/models/msg_model.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../widgets/snackBar.dart';
import '../../data/model/profile_model.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this.getProfileUseCase, this.editProfileUseCase)
      : super(EditProfileInitial());

  static EditProfileCubit of(context) => BlocProvider.of(context);

  final GetProfile getProfileUseCase;
  final EditProfile editProfileUseCase;

  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final jobTitleController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final bioController = TextEditingController();
  String? image;
  String? backgroundImage;
  ProfileModel? userData;

  Future getProfile() async {
    emit(GetProfileState(
      userState: RequestState.loading,
    ));
    final res = await getProfileUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetProfileState(
          message: err.message,
          userState: RequestState.error,
        ));
      },
      (res) {
        userData = res;
        image = res.user!.image;
        backgroundImage = res.user!.backgroundImage;
        nameController.text = res.user!.name!;
        emailController.text = res.user!.email!;
        phoneController.text = res.user!.phone!;
        emit(GetProfileState(
          userData: res,
          userState: RequestState.loaded,
        ));
      },
    );
  }

  Future editProfile() async {
    emit(EditProfileDataState(
      userState: RequestState.loading,
    ));
    final res = await editProfileUseCase.execute(
        nameController.text,
        lastNameController.text,
        emailController.text,
        phoneController.text,
        jobTitleController.text,
        bioController.text,
        image!,
        backgroundImage!);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(EditProfileDataState(
          message: err.message,
          userState: RequestState.error,
        ));
      },
      (res) async {
        emit(EditProfileDataState(
          userData: res,
          userState: RequestState.loaded,
        ));
      },
    );
  }
}
