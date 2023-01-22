import 'package:dartz/dartz.dart';
import 'package:switch_app/core/error/failure.dart';
import 'package:switch_app/core/models/user_model.dart';
import 'package:switch_app/view/register/data/datasource/register_remote_datasource.dart';
import 'package:switch_app/view/register/domain/repository/base_register_repository.dart';

import '../../../../core/error/exception.dart';

class RegisterRepository extends BaseRegisterRepository {
  final BaseRegisterRemoteDatasource baseRegisterRemoteDatasource;

  RegisterRepository(this.baseRegisterRemoteDatasource);

  @override
  Future<Either<Failure, UserModel>> register(
      name, lastName, jobTitle, email, phone, password, deviceToken) async {
    try {
      final res = await baseRegisterRemoteDatasource.register(
          name, lastName, jobTitle, email, phone, password, deviceToken);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }
}
