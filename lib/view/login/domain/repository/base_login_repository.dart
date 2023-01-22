import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/models/user_model.dart';

abstract class BaseLoginRepository {
  Future<Either<Failure, UserModel>> login(
      String email, String password, String deviceToken);
}
