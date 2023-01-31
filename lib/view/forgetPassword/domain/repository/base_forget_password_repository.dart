import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/models/msg_model.dart';

abstract class BaseForgetPasswordRepository {
  Future<Either<Failure, MsgModel>> forgetPassword(String email);
  Future<Either<Failure, MsgModel>> verficationCode(String email, String code);
  Future<Either<Failure, MsgModel>> resetPassword(String email, String password, String passwordConfirmation);
}