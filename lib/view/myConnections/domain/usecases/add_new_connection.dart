import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/models/msg_model.dart';
import '../repository/base_my_connection_repository.dart';

class AddNewConnection {
  final BaseMyConnectionRepository baseMyConnectionRepository;

  AddNewConnection(this.baseMyConnectionRepository);

  Future<Either<Failure, MsgModel>> execute(String name, String email,
      String title, String phone, String content) async {
    return await baseMyConnectionRepository.addNewConnection(
        name, email, title, phone, content);
  }
}
