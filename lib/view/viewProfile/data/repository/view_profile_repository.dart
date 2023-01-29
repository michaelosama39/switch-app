import 'package:dartz/dartz.dart';
import 'package:switch_app/core/error/failure.dart';
import 'package:switch_app/core/models/msg_model.dart';
import '../../../../core/error/exception.dart';
import '../../domain/repository/base_view_profle_repository.dart';
import '../datasource/view_profile_remote_datasource.dart';
import '../model/app_details_model.dart';

class ViewProfileRepository extends BaseViewProfileRepository {
  final BaseViewProfileRemoteDatasource baseViewProfileRemoteDatasource;

  ViewProfileRepository(this.baseViewProfileRemoteDatasource);

  @override
  Future<Either<Failure, AppDetailsModel>> showAppDetails() async {
    try {
      final res = await baseViewProfileRemoteDatasource.showAppDetails();
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, MsgModel>> editAppDetails(
      int appId, String title, String url) async {
    try {
      final res = await baseViewProfileRemoteDatasource.editAppDetails(
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
          await baseViewProfileRemoteDatasource.changeStatusApp(appId, status);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }
}
