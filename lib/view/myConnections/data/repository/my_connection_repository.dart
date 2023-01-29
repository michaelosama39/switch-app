import 'package:dartz/dartz.dart';
import 'package:switch_app/core/error/failure.dart';
import 'package:switch_app/core/models/msg_model.dart';
import 'package:switch_app/view/myConnections/data/model/connection_model.dart';
import '../../../../core/error/exception.dart';
import '../../domain/repository/base_my_connection_repository.dart';
import '../datasource/my_connection_remote_datasource.dart';

class MyConnectionRepository extends BaseMyConnectionRepository {
  final BaseMyConnectionRemoteDatasource baseMyConnectionRemoteDatasource;

  MyConnectionRepository(this.baseMyConnectionRemoteDatasource);

  @override
  Future<Either<Failure, MsgModel>> exchangeStatus(exchangeId, status) async {
    try {
      final res = await baseMyConnectionRemoteDatasource.exchangeStatus(
          exchangeId, status);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, ConnectionModel>> getExchangeList() async {
    try {
      final res = await baseMyConnectionRemoteDatasource.getExchangeList();
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, ConnectionModel>> getConnectionList() async {
    try {
      final res = await baseMyConnectionRemoteDatasource.getConnectionList();
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, MsgModel>> addNewConnection(
      name, email, title, phone, content) async {
    try {
      final res = await baseMyConnectionRemoteDatasource.addNewConnection(
          name, email, title, phone, content);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, MsgModel>> favouriteStatus(
      connectionId, status) async {
    try {
      final res = await baseMyConnectionRemoteDatasource.favouriteStatus(
          connectionId, status);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, ConnectionModel>> getFavouriteList() async {
    try {
      final res = await baseMyConnectionRemoteDatasource.getFavouriteList();
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, MsgModel>> deleteUserConnection(int connectionId) async{
    try {
      final res = await baseMyConnectionRemoteDatasource.deleteUserConnection(connectionId);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }
}
