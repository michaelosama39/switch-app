import 'package:dartz/dartz.dart';
import 'package:switch_app/core/error/failure.dart';
import 'package:switch_app/core/models/msg_model.dart';
import 'package:switch_app/view/setting/data/model/media_model.dart';
import '../../../../core/error/exception.dart';
import '../../domain/repository/base_setting_repository.dart';
import '../datasource/setting_remote_datasource.dart';

class SettingRepository extends BaseSettingRepository{
  final BaseSettingRemoteDatasource baseSettingRemoteDatasource;

  SettingRepository(this.baseSettingRemoteDatasource);

  @override
  Future<Either<Failure, MsgModel>> logout() async{
    try {
      final res = await baseSettingRemoteDatasource.logout();
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, MsgModel>> deleteAccount() async{
    try {
      final res = await baseSettingRemoteDatasource.deleteAccount();
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, MediaModel>> getMedia() async{
    try {
      final res = await baseSettingRemoteDatasource.getMedia();
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }
}