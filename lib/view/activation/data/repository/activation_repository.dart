import 'package:dartz/dartz.dart';
import 'package:switch_app/core/error/failure.dart';
import 'package:switch_app/core/models/msg_model.dart';
import '../../../../core/error/exception.dart';
import '../../domain/repository/base_activation_repository.dart';
import '../datasource/activation_remote_datasource.dart';
import '../model/orders_model.dart';

class ActivationRepository extends BaseActivationRepository{
  final BaseActivationRemoteDatasource baseActivationRemoteDatasource;

  ActivationRepository(this.baseActivationRemoteDatasource);

  @override
  Future<Either<Failure, OrdersModel>> getOrders() async{
    try {
      final res = await baseActivationRemoteDatasource.getOrders();
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, MsgModel>> activationProduct(serialNumber) async{
    try {
      final res = await baseActivationRemoteDatasource.activationProduct(serialNumber);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }
}