import 'package:dartz/dartz.dart';
import 'package:switch_app/view/addLinks/domain/repository/base_add_links_repository.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/models/applications_model.dart';

class GetSocialApps {
  final BaseAddLinksRepository baseAddLinksRepository;

  GetSocialApps(this.baseAddLinksRepository);

  Future<Either<Failure, ApplicationsModel>> execute() async {
    return await baseAddLinksRepository.getSocialApps();
  }
}
