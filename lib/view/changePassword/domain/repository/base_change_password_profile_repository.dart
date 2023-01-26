import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/models/msg_model.dart';

abstract class BaseChangePasswordRepository {
  Future<Either<Failure, MsgModel>> changePassword(
      String password, String newPassword, String newConfirmPassword);
}
