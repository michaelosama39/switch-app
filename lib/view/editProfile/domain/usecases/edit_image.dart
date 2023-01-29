import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:switch_app/core/error/failure.dart';
import 'package:switch_app/core/models/msg_model.dart';
import 'package:switch_app/view/editProfile/domain/repository/base_edit_profile_repository.dart';

class EditImage {
  final BaseEditProfileRepository baseEditProfileRepository;

  EditImage(this.baseEditProfileRepository);

  Future<Either<Failure, MsgModel>> execute(XFile image) async {
    return await baseEditProfileRepository.editImage(image);
  }
}
