import 'package:dartz/dartz.dart';
import 'package:switch_app/core/error/failure.dart';
import 'package:switch_app/view/login/data/datasource/login_remote_datasource.dart';
import 'package:switch_app/view/login/domain/repository/base_login_repository.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/models/user_model.dart';

class LoginRepository extends BaseLoginRepository {
  final BaseLoginRemoteDatasource baseLoginRemoteDatasource;

  LoginRepository(this.baseLoginRemoteDatasource);

  @override
  Future<Either<Failure, UserModel>> login(email, password) async {
    try {
      final res = await baseLoginRemoteDatasource.login(email, password);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }
}
