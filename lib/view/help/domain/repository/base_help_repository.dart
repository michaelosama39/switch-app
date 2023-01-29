import 'package:dartz/dartz.dart';
import 'package:switch_app/view/help/data/model/help_model.dart';
import '../../../../core/error/failure.dart';

abstract class BaseHelpRepository {
  Future<Either<Failure, HelpModel>> getHelp();
}