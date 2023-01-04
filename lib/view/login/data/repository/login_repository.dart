import 'package:dartz/dartz.dart';
import 'package:switch_app/core/error/failure.dart';
import 'package:switch_app/core/models/user_model.dart';
import 'package:switch_app/view/login/data/datasource/login_remote_datasource.dart';
import 'package:switch_app/view/login/domain/repository/base_login_repository.dart';

import '../../../../core/error/exception.dart';

class LoginRepository extends BaseLoginRepository {
  final BaseLoginRemoteDatasource baseLoginRemoteDatasource;

  LoginRepository(this.baseLoginRemoteDatasource);

  @override
  Future<Either<Failure, UserModel>> login(email, password) async {
    final res = await baseLoginRemoteDatasource.login(email, password);
    try {
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.status));
    }
  }
}
