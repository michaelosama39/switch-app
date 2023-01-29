import 'package:dartz/dartz.dart';
import 'package:switch_app/view/Profile/data/model/app_details_model.dart';
import '../../../../core/error/failure.dart';
import '../repository/base_profle_repository.dart';

class ShowAppDetails {
  final BaseProfileRepository baseProfleRepository;

  ShowAppDetails(this.baseProfleRepository);

  Future<Either<Failure, AppDetailsModel>> execute() async {
    return await baseProfleRepository.showAppDetails();
  }
}
