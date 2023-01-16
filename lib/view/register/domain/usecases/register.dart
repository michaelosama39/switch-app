import 'package:dartz/dartz.dart';
import 'package:switch_app/view/register/domain/repository/base_register_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/models/user_model.dart';

class Register {
  final BaseRegisterRepository baseRegisterRepository;

  Register(this.baseRegisterRepository);

  Future<Either<Failure, UserModel>> execute(String name, String lastName,
      String jobTitle, String email, String phone, String password) async {
    return await baseRegisterRepository.register(
        name, lastName, jobTitle, email, phone, password);
  }
}
