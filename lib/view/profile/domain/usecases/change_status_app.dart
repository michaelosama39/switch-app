import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/models/msg_model.dart';
import '../repository/base_profle_repository.dart';

class ChangeStatusApp {
  final BaseProfileRepository baseProfleRepository;

  ChangeStatusApp(this.baseProfleRepository);

  Future<Either<Failure, MsgModel>> execute(int appId, bool status) async {
    return await baseProfleRepository.changeStatusApp(appId, status);
  }
}
