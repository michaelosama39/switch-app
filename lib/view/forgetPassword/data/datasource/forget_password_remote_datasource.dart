import 'dart:convert';
import 'package:switch_app/core/models/msg_model.dart';
import '../../../../core/appStorage/app_storage.dart';
import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/models/error_message_model.dart';
import '../../../../core/utils/app_strings.dart';

abstract class BaseForgetPasswordRemoteDatasource {
  Future<MsgModel> forgetPassword(String email);

  Future<MsgModel> verficationCode(String email, String code);

  Future<MsgModel> resetPassword(
      String email, String password, String passwordConfirmation);
}

class ForgetPasswordRemoteDatasource
    extends BaseForgetPasswordRemoteDatasource {
  @override
  Future<MsgModel> forgetPassword(String email) async {
    final response = await DioHelper.post(
      AppStrings.endpoint_forgetPassword,
      headers: {
        'Accept-Language': 'application/json',
        'lang': AppStorage.getLang,
      },
      body: {
        "email": email,
      },
    );
    if (response.statusCode == 200 && response.data['status'] == true) {
      print("Success forgetPasswordRepo");
      return MsgModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MsgModel> verficationCode(String email, String code) async {
    final response = await DioHelper.post(
      AppStrings.endpoint_checkCode,
      headers: {
        'Accept-Language': 'application/json',
        'lang': AppStorage.getLang,
      },
      body: {
        "email": email,
        "checkCode": code,
      },
    );
    if (response.statusCode == 200 && response.data['status'] == true) {
      print("Success verficationCodeRepo");
      return MsgModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MsgModel> resetPassword(String email, String password, String passwordConfirmation) async{
    final response = await DioHelper.post(
      AppStrings.endpoint_resetPassword,
      headers: {
        'Accept-Language': 'application/json',
        'lang': AppStorage.getLang,
      },
      body: {
        "email": email,
        "password" : password,
        "password_confirmation" :  passwordConfirmation
      },
    );
    if (response.statusCode == 200 && response.data['status'] == true) {
      print("Success resetPasswordRepo");
      return MsgModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
