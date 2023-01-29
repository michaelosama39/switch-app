import 'package:dartz/dartz.dart';
import 'package:switch_app/view/viewProfile/data/model/app_details_model.dart';
import 'package:switch_app/view/viewProfile/domain/repository/base_view_profle_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/models/msg_model.dart';

class EditAppDetails {
  final BaseViewProfileRepository baseViewProfleRepository;

  EditAppDetails(this.baseViewProfleRepository);

  Future<Either<Failure, MsgModel>> execute(int appId, String title, String url) async {
    return await baseViewProfleRepository.editAppDetails(appId, title, url);
  }
}
