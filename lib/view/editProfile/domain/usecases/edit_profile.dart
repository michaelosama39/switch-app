import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:switch_app/core/error/failure.dart';
import 'package:switch_app/core/models/msg_model.dart';
import 'package:switch_app/view/editProfile/domain/repository/base_edit_profile_repository.dart';

class EditProfile {
  final BaseEditProfileRepository baseEditProfileRepository;

  EditProfile(this.baseEditProfileRepository);

  Future<Either<Failure, MsgModel>> execute(
      String name,
      String familyName,
      String email,
      String phone,
      String jobTitle,
      String bio,
      XFile image,
      XFile backgroundImage) async {
    return await baseEditProfileRepository.editProfile(name, familyName, email,
        phone, jobTitle, bio, image, backgroundImage);
  }
}
