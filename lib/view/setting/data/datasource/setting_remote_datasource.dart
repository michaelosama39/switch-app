import 'dart:convert';
import 'package:switch_app/core/models/msg_model.dart';
import 'package:switch_app/view/setting/data/model/media_model.dart';
import '../../../../core/appStorage/app_storage.dart';
import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/models/error_message_model.dart';
import '../../../../core/utils/app_strings.dart';

abstract class BaseSettingRemoteDatasource {
  Future<MsgModel> logout();

  Future<MsgModel> deleteAccount();

  Future<MediaModel> getMedia();
}

class SettingRemoteDatasource extends BaseSettingRemoteDatasource {
  @override
  Future<MsgModel> logout() async {
    final response = await DioHelper.post(AppStrings.endpoint_logout, headers: {
      'Accept-Language': 'application/json',
      'lang': AppStorage.getLang,
      'Authorization': 'Bearer ${AppStorage.getUserData.token}'
    }, body: {});
    if (response.statusCode == 200 && response.data['status'] == true) {
      print("Success logoutRepo");
      return MsgModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MsgModel> deleteAccount() async {
    final response =
        await DioHelper.post(AppStrings.endpoint_deleteAccount, headers: {
      'Accept-Language': 'application/json',
      'lang': AppStorage.getLang,
      'Authorization': 'Bearer ${AppStorage.getUserData.token}'
    }, body: {});
    if (response.statusCode == 200 && response.data['status'] == true) {
      print("Success deleteAccountRepo");
      return MsgModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MediaModel> getMedia() async {
    final response = await DioHelper.get(
      AppStrings.endpoint_media,
      headers: {
        'Accept-Language': 'application/json',
        'lang': AppStorage.getLang,
      },
    );
    if (response.statusCode == 200 && response.data['status'] == true) {
      print("Success getMediaRepo");
      return MediaModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
