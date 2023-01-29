import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/models/msg_model.dart';
import '../repository/base_view_profle_repository.dart';

class ChangeStatusApp {
  final BaseViewProfileRepository baseViewProfleRepository;

  ChangeStatusApp(this.baseViewProfleRepository);

  Future<Either<Failure, MsgModel>> execute(int appId, bool status) async {
    return await baseViewProfleRepository.changeStatusApp(appId, status);
  }
}
