import 'dart:convert';

import 'package:switch_app/core/models/user_model.dart';

import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/models/error_message_model.dart';
import '../../../../core/utils/app_strings.dart';

abstract class BaseLoginRemoteDatasource {
  Future<UserModel> login(String email, String password);
}

class LoginRemoteDatasource extends BaseLoginRemoteDatasource {
  @override
  Future<UserModel> login(email, password) async {
    final response = await DioHelper.post(
      AppStrings.endpoint_login,
      body: {
        'email': email,
        'password': password,
      },
    );
    if (response.statusCode == 200 && response.data['status'] == 'success') {
      print("Success LoginRepo");
      return UserModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
