import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/models/user_model.dart';

abstract class BaseRegisterRepository {
  Future<Either<Failure, UserModel>> register(
      String name, String email, String phone, String password);
}
