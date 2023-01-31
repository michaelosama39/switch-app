import 'package:dartz/dartz.dart';
import 'package:switch_app/core/models/msg_model.dart';
import '../../../../core/error/failure.dart';
import '../repository/base_forget_password_repository.dart';

class VerficationCode{
  final BaseForgetPasswordRepository baseForgetPasswordRepository;

  VerficationCode(this.baseForgetPasswordRepository);

  Future<Either<Failure, MsgModel>> execute(String email , String code) async {
    return await baseForgetPasswordRepository.verficationCode(email , code);
  }
}