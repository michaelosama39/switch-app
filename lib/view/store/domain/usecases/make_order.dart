import 'package:dartz/dartz.dart';
import 'package:switch_app/core/models/msg_model.dart';
import '../../../../core/error/failure.dart';
import '../repository/base_store_repository.dart';

class MakeOrder{
  final BaseStoreRepository baseStoreRepository;

  MakeOrder(this.baseStoreRepository);

  Future<Either<Failure, MsgModel>> execute(int productId) async {
    return await baseStoreRepository.makeOrder(productId);
  }
}