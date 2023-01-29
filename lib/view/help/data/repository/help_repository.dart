import 'package:dartz/dartz.dart';
import 'package:switch_app/core/error/failure.dart';
import 'package:switch_app/view/help/data/model/help_model.dart';
import '../../../../core/error/exception.dart';
import '../../domain/repository/base_help_repository.dart';
import '../datasource/help_remote_datasource.dart';

class HelpRepository extends BaseHelpRepository{
  final BaseHelpRemoteDatasource baseHelpRemoteDatasource;

  HelpRepository(this.baseHelpRemoteDatasource);

  @override
  Future<Either<Failure, HelpModel>> getHelp() async{
    try {
      final res = await baseHelpRemoteDatasource.getHelp();
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }
}