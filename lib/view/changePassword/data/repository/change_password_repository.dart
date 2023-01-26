import 'package:dartz/dartz.dart';
import 'package:switch_app/core/models/msg_model.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repository/base_change_password_profile_repository.dart';
import '../datasource/change_password_remote_datasource.dart';

class ChangePasswordRepository extends BaseChangePasswordRepository {
  final BaseChangePasswordRemoteDatasource baseChangePasswordRemoteDatasource;

  ChangePasswordRepository(this.baseChangePasswordRemoteDatasource);

  @override
  Future<Either<Failure, MsgModel>> changePassword(password, newPassword,newConfirmPassword) async {
    try {
      final res = await baseChangePasswordRemoteDatasource.changePassword(password, newPassword, newConfirmPassword);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }
}