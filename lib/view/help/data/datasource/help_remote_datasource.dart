import 'dart:convert';
import 'package:switch_app/core/models/msg_model.dart';
import 'package:switch_app/view/setting/data/model/media_model.dart';
import '../../../../core/appStorage/app_storage.dart';
import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/models/error_message_model.dart';
import '../../../../core/utils/app_strings.dart';
import '../model/help_model.dart';

abstract class BaseHelpRemoteDatasource {
  Future<HelpModel> getHelp();
}

class HelpRemoteDatasource extends BaseHelpRemoteDatasource {
  @override
  Future<HelpModel> getHelp() async {
    final response = await DioHelper.get(
      AppStrings.endpoint_faqs,
      headers: {
        'Accept-Language': 'application/json',
        'lang': AppStorage.getLang,
      },
    );
    if (response.statusCode == 200 && response.data['status'] == true) {
      print("Success getHelpRepo");
      return HelpModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
