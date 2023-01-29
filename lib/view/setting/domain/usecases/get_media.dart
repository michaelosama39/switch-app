import 'package:dartz/dartz.dart';
import 'package:switch_app/view/setting/data/model/media_model.dart';
import '../../../../core/error/failure.dart';
import '../repository/base_setting_repository.dart';

class GetMedia {
  final BaseSettingRepository baseSettingRepository;

  GetMedia(this.baseSettingRepository);

  Future<Either<Failure, MediaModel>> execute() async {
    return await baseSettingRepository.getMedia();
  }
}
