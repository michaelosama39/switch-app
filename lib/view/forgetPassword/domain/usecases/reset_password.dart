import 'package:dartz/dartz.dart';
import 'package:switch_app/core/models/msg_model.dart';
import '../../../../core/error/failure.dart';
import '../repository/base_forget_password_repository.dart';

class ResetPassword {
  final BaseForgetPasswordRepository baseForgetPasswordRepository;

  ResetPassword(this.baseForgetPasswordRepository);

  Future<Either<Failure, MsgModel>> execute(
      String email, String password, String passwordConfirmation) async {
    return await baseForgetPasswordRepository.resetPassword(
        email, password, passwordConfirmation);
  }
}
