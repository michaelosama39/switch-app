import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/model/app_details_model.dart';

abstract class BaseViewProfileRepository {
  Future<Either<Failure, AppDetailsModel>> showAppDetails(String categoryName);
}