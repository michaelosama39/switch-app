import 'package:dartz/dartz.dart';
import 'package:switch_app/core/models/msg_model.dart';
import '../../../../core/error/failure.dart';
import '../../data/model/products_model.dart';

abstract class BaseStoreRepository {
  Future<Either<Failure, ProductsModel>> getAllProducts();
  Future<Either<Failure, MsgModel>> makeOrder(int productId);
}