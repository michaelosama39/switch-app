import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/models/msg_model.dart';
import '../../data/model/profile_model.dart';

abstract class BaseEditProfileRepository {
  Future<Either<Failure, ProfileModel>> getProfile();

  Future<Either<Failure, MsgModel>> editImage(XFile image);

  Future<Either<Failure, MsgModel>> editBackgroundImage(XFile backgroundImage);

  Future<Either<Failure, MsgModel>> editProfile(String name, String familyName,
      String email, String phone, String jobTitle, String bio);
}
