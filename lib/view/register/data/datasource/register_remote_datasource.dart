import 'dart:convert';
import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/models/error_message_model.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/utils/app_strings.dart';

abstract class BaseRegisterRemoteDatasource {
  Future<UserModel> register(
      String name, String email, String phone, String password);
}

class RegisterRemoteDatasource extends BaseRegisterRemoteDatasource {
  @override
  Future<UserModel> register(name, email, phone, password) async {
    final response = await DioHelper.post(
      AppStrings.endpoint_register,
      body: {
        'name': name,
        'email': email,
        'mobile': phone,
        'password': password,
      },
    );
    if (response.statusCode == 200 && response.data['status'] == 'success') {
      print("Success RegisterRepo");
      return UserModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
