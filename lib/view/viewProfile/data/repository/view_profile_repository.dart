import 'package:dartz/dartz.dart';
import 'package:switch_app/core/error/failure.dart';
import 'package:switch_app/core/models/msg_model.dart';
import '../../../../core/error/exception.dart';
import '../../../Profile/data/model/app_details_model.dart';
import '../../domain/repository/base_view_profle_repository.dart';
import '../datasource/view_profile_remote_datasource.dart';

class ViewProfileRepository extends BaseViewProfileRepository {
  BaseViewProfileRemoteDatasource baseViewProfileRemoteDatasource;
  ViewProfileRepository(this.baseViewProfileRemoteDatasource);

}
