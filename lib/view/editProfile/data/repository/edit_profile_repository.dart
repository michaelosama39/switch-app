import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:switch_app/core/models/msg_model.dart';
import 'package:switch_app/core/models/user_model.dart';
import 'package:switch_app/view/editProfile/data/datasource/edit_profile_remote_datasource.dart';
import 'package:switch_app/view/editProfile/domain/repository/base_edit_profile_repository.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../model/profile_model.dart';

class EditProfileRepository extends BaseEditProfileRepository {
  final BaseEditProfileRemoteDatasource baseEditProfileRemoteDatasource;

  EditProfileRepository(this.baseEditProfileRemoteDatasource);

  @override
  Future<Either<Failure, ProfileModel>> getProfile() async {
    try {
      final res = await baseEditProfileRemoteDatasource.getProfileData();
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, MsgModel>> editProfile(
      String name,
      String familyName,
      String email,
      String phone,
      String jobTitle,
      String bio,
      XFile image,
      XFile backgroundImage) async {
    try {
      final res = await baseEditProfileRemoteDatasource.editProfile(name,
          familyName, email, phone, jobTitle, bio, image, backgroundImage);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }
}
