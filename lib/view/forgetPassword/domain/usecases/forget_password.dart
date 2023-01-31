import 'package:dartz/dartz.dart';
import 'package:switch_app/core/models/msg_model.dart';
import '../../../../core/error/failure.dart';
import '../repository/base_forget_password_repository.dart';

class ForgetPassword{
  final BaseForgetPasswordRepository baseForgetPasswordRepository;

  ForgetPassword(this.baseForgetPasswordRepository);

  Future<Either<Failure, MsgModel>> execute(String email) async {
    return await baseForgetPasswordRepository.forgetPassword(email);
  }
}