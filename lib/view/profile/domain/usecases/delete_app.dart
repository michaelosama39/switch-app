import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/models/msg_model.dart';
import '../repository/base_profle_repository.dart';

class DeleteApp {
  final BaseProfileRepository baseProfleRepository;

  DeleteApp(this.baseProfleRepository);

  Future<Either<Failure, MsgModel>> execute(int appId) async {
    return await baseProfleRepository.deleteApp(appId);
  }
}
