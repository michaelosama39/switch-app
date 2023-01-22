import 'dart:convert';

import 'package:switch_app/core/appStorage/app_storage.dart';
import 'package:switch_app/core/models/user_model.dart';

import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/models/error_message_model.dart';
import '../../../../core/utils/app_strings.dart';

abstract class BaseLoginRemoteDatasource {
  Future<UserModel> login(String email, String password, String deviceToken);
}

class LoginRemoteDatasource extends BaseLoginRemoteDatasource {
  @override
  Future<UserModel> login(email, password, deviceToken) async {
    final response = await DioHelper.post(AppStrings.endpoint_login, body: {
      'email': email,
      'password': password,
      'device_token': deviceToken,
    }, headers: {
      'Accept-Language': 'application/json',
      'lang': AppStorage.getLang
    });
    if (response.statusCode == 200 && response.data['status'] == true) {
      print("Success LoginRepo");
      return UserModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
