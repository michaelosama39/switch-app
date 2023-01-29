import 'package:dartz/dartz.dart';
import 'package:switch_app/core/models/msg_model.dart';
import '../../../../core/error/failure.dart';
import '../../data/model/connection_model.dart';

abstract class BaseMyConnectionRepository {
  Future<Either<Failure, MsgModel>> exchangeStatus(int exchangeId, int status);

  Future<Either<Failure, ConnectionModel>> getExchangeList();

  Future<Either<Failure, ConnectionModel>> getConnectionList();

  Future<Either<Failure, MsgModel>> addNewConnection(
      String name, String email, String title, String phone, String content);

  Future<Either<Failure, MsgModel>> favouriteStatus(
      int connectionId, int status);

  Future<Either<Failure, ConnectionModel>> getFavouriteList();
  Future<Either<Failure, MsgModel>> deleteUserConnection(int connectionId);
}
