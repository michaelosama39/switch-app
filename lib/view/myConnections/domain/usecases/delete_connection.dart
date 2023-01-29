import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/models/msg_model.dart';
import '../repository/base_my_connection_repository.dart';

class DeleteConnection {
  final BaseMyConnectionRepository baseMyConnectionRepository;

  DeleteConnection(this.baseMyConnectionRepository);

  Future<Either<Failure, MsgModel>> execute(int connectionId) async {
    return await baseMyConnectionRepository.deleteUserConnection(connectionId);
  }
}
