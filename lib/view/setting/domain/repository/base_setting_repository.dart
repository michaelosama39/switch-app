import 'package:dartz/dartz.dart';
import 'package:switch_app/core/models/msg_model.dart';
import '../../../../core/error/failure.dart';
import '../../data/model/media_model.dart';

abstract class BaseSettingRepository {
  Future<Either<Failure, MsgModel>> logout();
  Future<Either<Failure, MsgModel>> deleteAccount();
  Future<Either<Failure, MediaModel>> getMedia();
}