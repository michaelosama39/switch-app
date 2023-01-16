import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/models/applications_model.dart';
import '../repository/base_add_links_repository.dart';

class GetBusinessApps {
  final BaseAddLinksRepository baseAddLinksRepository;

  GetBusinessApps(this.baseAddLinksRepository);

  Future<Either<Failure, ApplicationsModel>> execute() async {
    return await baseAddLinksRepository.getBusinessApps();
  }
}