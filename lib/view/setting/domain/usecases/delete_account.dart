import 'package:dartz/dartz.dart';
import 'package:switch_app/core/models/msg_model.dart';
import 'package:switch_app/view/setting/domain/repository/base_setting_repository.dart';
import '../../../../core/error/failure.dart';

class DeleteAccount{
  final BaseSettingRepository baseSettingRepository;

  DeleteAccount(this.baseSettingRepository);

  Future<Either<Failure, MsgModel>> execute() async {
    return await baseSettingRepository.deleteAccount();
  }
}