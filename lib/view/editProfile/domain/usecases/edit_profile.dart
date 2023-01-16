import 'package:dartz/dartz.dart';
import 'package:switch_app/core/error/failure.dart';
import 'package:switch_app/core/models/msg_model.dart';
import 'package:switch_app/view/editProfile/domain/repository/base_edit_profile_repository.dart';
import 'package:switch_app/view/login/domain/repository/base_login_repository.dart';

import '../../../../core/models/user_model.dart';

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
      String image,
      String backgroundImage) async {
    return await baseEditProfileRepository.editProfile(name, familyName, email,
        phone, jobTitle, bio, image, backgroundImage);
  }
}
