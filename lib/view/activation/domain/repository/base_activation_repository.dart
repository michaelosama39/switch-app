import 'package:dartz/dartz.dart';
import 'package:switch_app/view/activation/data/model/orders_model.dart';
import '../../../../core/error/failure.dart';

abstract class BaseActivationRepository {
  Future<Either<Failure, OrdersModel>> getOrders();
}