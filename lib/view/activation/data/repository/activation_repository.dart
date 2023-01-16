import 'package:dartz/dartz.dart';
import 'package:switch_app/core/error/failure.dart';
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
}