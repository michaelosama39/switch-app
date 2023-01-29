import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:switch_app/core/error/failure.dart';
import 'package:switch_app/core/models/msg_model.dart';
import 'package:switch_app/view/editProfile/domain/repository/base_edit_profile_repository.dart';

class EditBackgroundImage {
  final BaseEditProfileRepository baseEditProfileRepository;

  EditBackgroundImage(this.baseEditProfileRepository);

  Future<Either<Failure, MsgModel>> execute(XFile backgroundImage) async {
    return await baseEditProfileRepository.editBackgroundImage(backgroundImage);
  }
}
