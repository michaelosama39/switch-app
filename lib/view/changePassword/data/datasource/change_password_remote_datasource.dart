import 'dart:convert';

import 'package:switch_app/core/appStorage/app_storage.dart';
import 'package:switch_app/core/models/msg_model.dart';
import 'package:switch_app/core/models/user_model.dart';

import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/models/error_message_model.dart';
import '../../../../core/utils/app_strings.dart';

abstract class BaseChangePasswordRemoteDatasource {
  Future<MsgModel> changePassword(
      String password, String newPassword, String newConfirmPassword);
}

class ChangePasswordRemoteDatasource
    extends BaseChangePasswordRemoteDatasource {
  @override
  Future<MsgModel> changePassword(
      password, newPassword, newConfirmPassword) async {
    final response = await DioHelper.post(AppStrings.endpoint_changePassword, body: {
      'password': password,
      'new_password': newPassword,
      'new_confirm_password': newConfirmPassword,
    }, headers: {
      'Accept-Language': 'application/json',
      'lang': AppStorage.getLang,
      'Authorization': 'Bearer ${AppStorage.getUserData.token}'
    });
    if (response.statusCode == 200 && response.data['status'] == true) {
      print("Success ChangePasswordRepo");
      return MsgModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
