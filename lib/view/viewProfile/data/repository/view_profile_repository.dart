import 'package:dartz/dartz.dart';
import 'package:switch_app/core/error/failure.dart';
import '../../../../core/error/exception.dart';
import '../../domain/repository/base_view_profle_repository.dart';
import '../datasource/view_profile_remote_datasource.dart';
import '../model/app_details_model.dart';

class ViewProfileRepository extends BaseViewProfileRepository{
  final BaseViewProfileRemoteDatasource baseViewProfileRemoteDatasource;

  ViewProfileRepository(this.baseViewProfileRemoteDatasource);

  @override
  Future<Either<Failure, AppDetailsModel>> showAppDetails(categoryName) async{
    try {
      final res = await baseViewProfileRemoteDatasource.showAppDetails(categoryName);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

}