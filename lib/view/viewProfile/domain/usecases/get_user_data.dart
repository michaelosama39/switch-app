import 'package:dartz/dartz.dart';
import 'package:switch_app/core/error/failure.dart';
import 'package:switch_app/core/models/user_data_model.dart';
import 'package:switch_app/view/viewProfile/domain/repository/base_view_profle_repository.dart';

class GetUserData {
  final BaseViewProfileRepository baseViewProfileRepository;

  GetUserData(this.baseViewProfileRepository);

  Future<Either<Failure, UserDataModel>> execute() async {
    return await baseViewProfileRepository.getUserData();
  }
}