import 'package:dartz/dartz.dart';
import 'package:switch_app/core/error/failure.dart';
import 'package:switch_app/core/models/applications_model.dart';
import 'package:switch_app/core/models/msg_model.dart';
import 'package:switch_app/view/addLinks/data/datasource/add_links_remote_datasource.dart';
import 'package:switch_app/view/addLinks/domain/repository/base_add_links_repository.dart';

import '../../../../core/error/exception.dart';

class AddLinksRepository extends BaseAddLinksRepository {
  final BaseAddLinksRemoteDatasource baseAddLinksRemoteDatasource;

  AddLinksRepository(this.baseAddLinksRemoteDatasource);

  @override
  Future<Either<Failure, ApplicationsModel>> getSocialApps() async {
    try {
      final res = await baseAddLinksRemoteDatasource.getSocialApps();
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, ApplicationsModel>> getMusicApps() async {
    try {
      final res = await baseAddLinksRemoteDatasource.getMusicApps();
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, ApplicationsModel>> getCreativeApps() async {
    try {
      final res = await baseAddLinksRemoteDatasource.getCreativeApps();
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, ApplicationsModel>> getBusinessApps() async {
    try {
      final res = await baseAddLinksRemoteDatasource.getBusinessApps();
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, MsgModel>> addLink(String pageTitle, String url, String categoryName, int typeId) async{
    try {
      final res = await baseAddLinksRemoteDatasource.addLink(pageTitle, url, categoryName, typeId);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }
}
