import 'package:dartz/dartz.dart';

import 'package:switch_app/core/error/failure.dart';
import 'package:switch_app/core/models/msg_model.dart';

import 'package:switch_app/view/store/data/datasource/store_remote_datasource.dart';

import '../../../../core/error/exception.dart';
import '../../domain/repository/base_store_repository.dart';
import '../model/products_model.dart';

class StoreRepository extends BaseStoreRepository{
  final BaseStoreRemoteDatasource baseStoreRemoteDatasource;

  StoreRepository(this.baseStoreRemoteDatasource);

  @override
  Future<Either<Failure, ProductsModel>> getAllProducts() async{
    try {
      final res = await baseStoreRemoteDatasource.getAllProducts();
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, MsgModel>> makeOrder(productId) async{
    try {
      final res = await baseStoreRemoteDatasource.makeOrder(productId);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }
}