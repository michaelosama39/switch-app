import 'dart:convert';
import 'package:switch_app/core/appStorage/app_storage.dart';
import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/models/error_message_model.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/utils/app_strings.dart';

abstract class BaseRegisterRemoteDatasource {
  Future<UserModel> register(String name, String lastName, String jobTitle,
      String email, String phone, String password);
}

class RegisterRemoteDatasource extends BaseRegisterRemoteDatasource {
  @override
  Future<UserModel> register(
      name, lastName, jobTitle, email, phone, password) async {
    final response = await DioHelper.post(
      AppStrings.endpoint_register,
      body: {
        'name': name,
        'familyName': lastName,
        'job_title': jobTitle,
        'email': email,
        'phone': phone,
        'password': password,
      },
        headers: {
          'Accept-Language' : 'application/json',
          'lang' : AppStorage.getLang
        }
    );
    if (response.statusCode == 200 && response.data['status'] == true) {
      print("Success RegisterRepo");
      await AppStorage.cacheUserInfo(UserModel.fromJson(jsonDecode(response.toString())));
      return UserModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
