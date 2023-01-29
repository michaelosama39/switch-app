import 'package:dartz/dartz.dart';
import 'package:switch_app/core/error/failure.dart';
import 'package:switch_app/core/models/msg_model.dart';
import '../../../../core/error/exception.dart';
import '../../../Profile/data/model/app_details_model.dart';
import '../../domain/repository/base_profle_repository.dart';
import '../datasource/profile_remote_datasource.dart';

class ProfileRepository extends BaseProfileRepository {
  final BaseProfileRemoteDatasource baseProfileRemoteDatasource;

  ProfileRepository(this.baseProfileRemoteDatasource);

  @override
  Future<Either<Failure, AppDetailsModel>> showAppDetails() async {
    try {
      final res = await baseProfileRemoteDatasource.showAppDetails();
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, MsgModel>> editAppDetails(
      int appId, String title, String url) async {
    try {
      final res = await baseProfileRemoteDatasource.editAppDetails(
          appId, title, url);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, MsgModel>> changeStatusApp(
      int appId, bool status) async {
    try {
      final res =
          await baseProfileRemoteDatasource.changeStatusApp(appId, status);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }
}
