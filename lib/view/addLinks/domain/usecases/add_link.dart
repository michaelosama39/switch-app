import 'package:dartz/dartz.dart';
import 'package:switch_app/core/models/msg_model.dart';
import '../../../../core/error/failure.dart';
import '../repository/base_add_links_repository.dart';

class AddLink {
  final BaseAddLinksRepository baseAddLinksRepository;

  AddLink(this.baseAddLinksRepository);

  Future<Either<Failure, MsgModel>> execute(
      String pageTitle, String url, String categoryName, int typeId) async {
    return await baseAddLinksRepository.addLink(
        pageTitle, url, categoryName, typeId);
  }
}
