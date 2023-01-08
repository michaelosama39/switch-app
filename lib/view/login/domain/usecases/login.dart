import 'package:dartz/dartz.dart';
import 'package:switch_app/core/error/failure.dart';
import 'package:switch_app/core/models/user_model.dart';
import 'package:switch_app/view/login/domain/repository/base_login_repository.dart';

class Login {
  final BaseLoginRepository baseLoginRepository;

  Login(this.baseLoginRepository);

  Future<Either<Failure, UserModel>> execute(
      String email, String password) async {
    return await baseLoginRepository.login(email, password);
  }
}