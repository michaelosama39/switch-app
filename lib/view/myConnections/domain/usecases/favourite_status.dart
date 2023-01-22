
import 'package:dartz/dartz.dart';
import 'package:switch_app/view/myConnections/domain/repository/base_my_connection_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/models/msg_model.dart';

class FavouriteStatus{
  final BaseMyConnectionRepository baseMyConnectionRepository;

  FavouriteStatus(this.baseMyConnectionRepository);

  Future<Either<Failure, MsgModel>> execute(int connectionId, int status) async {
    return await baseMyConnectionRepository.favouriteStatus(connectionId, status);
  }
}