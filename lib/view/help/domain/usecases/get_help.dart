import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/model/help_model.dart';
import '../repository/base_help_repository.dart';

class GetHelp {
  final BaseHelpRepository baseHelpRepository;

  GetHelp(this.baseHelpRepository);

  Future<Either<Failure, HelpModel>> execute() async {
    return await baseHelpRepository.getHelp();
  }
}