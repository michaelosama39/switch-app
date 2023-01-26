import 'package:dartz/dartz.dart';
import 'package:switch_app/view/changePassword/domain/repository/base_change_password_profile_repository.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/models/msg_model.dart';

class ChangePassword {
  final BaseChangePasswordRepository baseChangePasswordRepository;

  ChangePassword(this.baseChangePasswordRepository);

  Future<Either<Failure, MsgModel>> execute(
      String password, String newPassword, String newConfirmPassword) async {
    return await baseChangePasswordRepository.changePassword(
        password, newPassword, newConfirmPassword);
  }
}
