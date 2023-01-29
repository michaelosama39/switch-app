import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/models/msg_model.dart';
import '../repository/base_profle_repository.dart';

class EditAppDetails {
  final BaseProfileRepository baseProfleRepository;

  EditAppDetails(this.baseProfleRepository);

  Future<Either<Failure, MsgModel>> execute(int appId, String title, String url) async {
    return await baseProfleRepository.editAppDetails(appId, title, url);
  }
}
