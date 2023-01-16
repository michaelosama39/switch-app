import 'package:dartz/dartz.dart';
import 'package:switch_app/core/models/msg_model.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/models/applications_model.dart';

abstract class BaseAddLinksRepository {
  Future<Either<Failure, ApplicationsModel>> getSocialApps();

  Future<Either<Failure, ApplicationsModel>> getMusicApps();

  Future<Either<Failure, ApplicationsModel>> getCreativeApps();

  Future<Either<Failure, ApplicationsModel>> getBusinessApps();

  Future<Either<Failure, MsgModel>> addLink(
      String pageTitle, String url, String categoryName, int typeId);
}
