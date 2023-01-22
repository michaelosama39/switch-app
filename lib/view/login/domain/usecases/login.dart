import 'package:dartz/dartz.dart';
import 'package:switch_app/core/error/failure.dart';
import 'package:switch_app/view/login/domain/repository/base_login_repository.dart';

import '../../../../core/models/user_model.dart';

class Login {
  final BaseLoginRepository baseLoginRepository;

  Login(this.baseLoginRepository);

  Future<Either<Failure, UserModel>> execute(
      String email, String password , String deviceToken) async {
    return await baseLoginRepository.login(email, password , deviceToken);
  }
}