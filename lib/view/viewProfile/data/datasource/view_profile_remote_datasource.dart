import 'dart:convert';

import 'package:switch_app/core/models/user_data_model.dart';

import '../../../../core/appStorage/app_storage.dart';
import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/models/error_message_model.dart';
import '../../../../core/utils/app_strings.dart';

abstract class BaseViewProfileRemoteDatasource {
  Future<UserDataModel> getUserData();
}

class ViewProfileRemoteDatasource extends BaseViewProfileRemoteDatasource {

  @override
  Future<UserDataModel> getUserData() async{
    final response = await DioHelper.get(
        "${AppStrings.endpoint_user}/${AppStorage.getUserInfo!.data!.id}",
        headers: {
          'Accept-Language': 'application/json',
          'lang': AppStorage.getLang,
        });
    if (response.statusCode == 200) {
      print("Success getProfileDataRepo");
      return UserDataModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
