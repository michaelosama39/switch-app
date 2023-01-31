import 'package:dartz/dartz.dart';
import 'package:switch_app/core/error/failure.dart';
import 'package:switch_app/core/models/msg_model.dart';
import '../../../../core/error/exception.dart';
import '../../domain/repository/base_forget_password_repository.dart';
import '../datasource/forget_password_remote_datasource.dart';

class ForgetPasswordRepository extends BaseForgetPasswordRepository {
  final BaseForgetPasswordRemoteDatasource baseForgetPasswordRemoteDatasource;

  ForgetPasswordRepository(this.baseForgetPasswordRemoteDatasource);

  @override
  Future<Either<Failure, MsgModel>> forgetPassword(String email) async {
    try {
      final res =
          await baseForgetPasswordRemoteDatasource.forgetPassword(email);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, MsgModel>> verficationCode(
      String email, String code) async {
    try {
      final res =
          await baseForgetPasswordRemoteDatasource.verficationCode(email, code);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, MsgModel>> resetPassword(
      String email, String password, String passwordConfirmation) async{
    try {
      final res = await baseForgetPasswordRemoteDatasource.resetPassword(
          email, password, passwordConfirmation);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }
}
