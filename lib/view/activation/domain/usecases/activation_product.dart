import 'package:dartz/dartz.dart';
import 'package:switch_app/core/models/msg_model.dart';
import 'package:switch_app/view/activation/domain/repository/base_activation_repository.dart';
import '../../../../core/error/failure.dart';
import '../../data/model/orders_model.dart';

class ActivationProduct{
  final BaseActivationRepository baseActivationRepository;

  ActivationProduct(this.baseActivationRepository);

  Future<Either<Failure, MsgModel>> execute(String serialNumber) async {
    return await baseActivationRepository.activationProduct(serialNumber);
  }
}