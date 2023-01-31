import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/view/bottomNav/presentation/screens/bottom_nav_screen.dart';
import 'package:switch_app/view/editProfile/domain/usecases/edit_background_image.dart';
import 'package:switch_app/view/editProfile/domain/usecases/edit_image.dart';
import 'package:switch_app/view/editProfile/domain/usecases/edit_profile.dart';
import 'package:switch_app/view/editProfile/domain/usecases/get_profile.dart';
import '../../../../widgets/snackBar.dart';
import '../../data/model/profile_model.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this.getProfileUseCase, this.editProfileUseCase,
      this.editImageUseCase, this.editBackgroundImageUseCase)
      : super(EditProfileInitial());

  static EditProfileCubit of(context) => BlocProvider.of(context);

  final GetProfile getProfileUseCase;
  final EditProfile editProfileUseCase;
  final EditImage editImageUseCase;
  final EditBackgroundImage editBackgroundImageUseCase;

  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final jobTitleController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final bioController = TextEditingController();
  ProfileModel? userData;
  XFile? backgroundImage;
  XFile? profileImage;

  Future getProfile() async {
    emit(GetProfileLoading());
    final res = await getProfileUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(EditProfileInitial());
      },
      (res) {
        userData = res;
        nameController.text = res.user!.name.toString();
        lastNameController.text = res.user!.familyName.toString();
        emailController.text = res.user!.email.toString();
        phoneController.text = res.user!.phone.toString();
        jobTitleController.text = res.user!.jobTitle.toString();
        bioController.text = res.user!.bio.toString();
        emit(EditProfileInitial());
      },
    );
  }

  Future editProfile() async {
    emit(EditProfileDataLoading());
    final res = await editProfileUseCase.execute(
      nameController.text,
      lastNameController.text,
      emailController.text,
      phoneController.text,
      jobTitleController.text,
      bioController.text,
    );
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(EditProfileInitial());
      },
      (res) async {
        emit(EditProfileInitial());
        MagicRouter.navigateAndPopAll(BottomNavScreen());
      },
    );
  }

  Future editImage() async {
    emit(EditImageLoading());
    final res = await editImageUseCase.execute(profileImage!);
    print(res);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(EditProfileInitial());
      },
      (res) async {
        emit(EditProfileInitial());
        MagicRouter.navigateAndPopAll(BottomNavScreen());
      },
    );
  }

  Future editBackgroundImage() async {
    emit(EditBackgroundImageLoading());
    final res = await editBackgroundImageUseCase.execute(backgroundImage!);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(EditProfileInitial());
      },
      (res) async {
        emit(EditProfileInitial());
        MagicRouter.navigateAndPopAll(BottomNavScreen());
      },
    );
  }

  Future selectImage() async {
    await ImagePicker()
        .pickImage(source: ImageSource.gallery)
        .then((value) => profileImage = value);
    editImage();
    emit(SelectImageState());
  }

  Future selectBackgroundImage() async {
    await ImagePicker()
        .pickImage(source: ImageSource.gallery)
        .then((value) => backgroundImage = value);
    editBackgroundImage();
    emit(SelectImageState());
  }
}
