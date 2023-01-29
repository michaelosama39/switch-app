import 'package:dartz/dartz.dart';
import 'package:switch_app/core/models/msg_model.dart';
import '../../../../core/error/failure.dart';
import '../../data/model/app_details_model.dart';

abstract class BaseViewProfileRepository {
  Future<Either<Failure, AppDetailsModel>> showAppDetails();
  Future<Either<Failure, MsgModel>> editAppDetails(int appId, String title, String url);
  Future<Either<Failure, MsgModel>> changeStatusApp(int appId, bool status);
}