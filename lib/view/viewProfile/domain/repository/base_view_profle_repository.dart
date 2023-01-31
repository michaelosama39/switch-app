
import 'package:dartz/dartz.dart';
import 'package:switch_app/core/models/user_data_model.dart';

import '../../../../core/error/failure.dart';

abstract class BaseViewProfileRepository {
  Future<Either<Failure, UserDataModel>> getUserData();
}