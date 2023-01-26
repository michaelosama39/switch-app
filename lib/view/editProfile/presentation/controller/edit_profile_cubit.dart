import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:switch_app/view/editProfile/domain/usecases/edit_profile.dart';
import 'package:switch_app/view/editProfile/domain/usecases/get_profile.dart';
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
  ProfileModel? userData;
  XFile? backgroundImage;
  XFile? image;

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
        image!,
        backgroundImage!);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(EditProfileInitial());
      },
      (res) async {
        emit(EditProfileInitial());
      },
    );
  }

  Future selectImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    this.image = image!;
    emit(SelectImageState());
  }

  Future selectBackgroundImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    backgroundImage = image!;
    emit(SelectImageState());
  }
}
