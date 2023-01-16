import 'package:dartz/dartz.dart';
import 'package:switch_app/core/error/failure.dart';
import 'package:switch_app/view/editProfile/domain/repository/base_edit_profile_repository.dart';
import 'package:switch_app/view/login/domain/repository/base_login_repository.dart';

import '../../../../core/models/user_model.dart';
import '../../data/model/profile_model.dart';

class GetProfile {
  final BaseEditProfileRepository baseEditProfileRepository;

  GetProfile(this.baseEditProfileRepository);

  Future<Either<Failure, ProfileModel>> execute() async {
    return await baseEditProfileRepository.getProfile();
  }
}