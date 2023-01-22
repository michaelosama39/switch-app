import 'package:dartz/dartz.dart';
import 'package:switch_app/view/viewProfile/data/model/app_details_model.dart';
import 'package:switch_app/view/viewProfile/domain/repository/base_view_profle_repository.dart';

import '../../../../core/error/failure.dart';

class ShowAppDetails {
  final BaseViewProfileRepository baseViewProfleRepository;

  ShowAppDetails(this.baseViewProfleRepository);

  Future<Either<Failure, AppDetailsModel>> execute(String categoryName) async {
    return await baseViewProfleRepository.showAppDetails(categoryName);
  }
}
