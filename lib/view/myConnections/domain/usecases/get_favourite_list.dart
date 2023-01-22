import 'package:dartz/dartz.dart';
import 'package:switch_app/view/myConnections/data/model/connection_model.dart';
import '../../../../core/error/failure.dart';
import '../repository/base_my_connection_repository.dart';

class GetFavouriteList{
  final BaseMyConnectionRepository baseMyConnectionRepository;

  GetFavouriteList(this.baseMyConnectionRepository);

  Future<Either<Failure, ConnectionModel>> execute() async {
    return await baseMyConnectionRepository.getFavouriteList();
  }
}