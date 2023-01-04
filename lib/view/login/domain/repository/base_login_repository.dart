import 'package:dartz/dartz.dart';
import 'package:switch_app/core/models/user_model.dart';

import '../../../../core/error/failure.dart';

abstract class BaseLoginRepository {
  Future<Either<Failure, UserModel>> login(String email, String password);
}
