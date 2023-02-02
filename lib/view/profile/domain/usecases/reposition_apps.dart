import 'package:dartz/dartz.dart';
import 'package:switch_app/core/models/msg_model.dart';

import '../../../../core/error/failure.dart';
import '../repository/base_profle_repository.dart';

class RepositionApps {
  final BaseProfileRepository baseProfleRepository;

  RepositionApps(this.baseProfleRepository);

  Future<Either<Failure, MsgModel>> execute(String acc1, String acc2) async {
    return await baseProfleRepository.repositionApps(acc1, acc2);
  }
}
