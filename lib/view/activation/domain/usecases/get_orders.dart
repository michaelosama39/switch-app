import 'package:dartz/dartz.dart';
import 'package:switch_app/view/activation/domain/repository/base_activation_repository.dart';
import '../../../../core/error/failure.dart';
import '../../data/model/orders_model.dart';

class GetOrders{
  final BaseActivationRepository baseActivationRepository;

  GetOrders(this.baseActivationRepository);

  Future<Either<Failure, OrdersModel>> execute() async {
    return await baseActivationRepository.getOrders();
  }
}