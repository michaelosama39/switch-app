import 'dart:convert';
import 'package:switch_app/core/models/msg_model.dart';
import '../../../../core/appStorage/app_storage.dart';
import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/models/error_message_model.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../Profile/data/model/app_details_model.dart';

abstract class BaseProfileRemoteDatasource {
  Future<AppDetailsModel> showAppDetails();

  Future<MsgModel> editAppDetails(int appId, String title, String url);

  Future<MsgModel> changeStatusApp(int appId, bool status);

  Future<MsgModel> deleteApp(int appId);
}

class ProfileRemoteDatasource extends BaseProfileRemoteDatasource {
  @override
  Future<AppDetailsModel> showAppDetails() async {
    final response = await DioHelper.get(AppStrings.endpoint_show, headers: {
      'Accept-Language': 'application/json',
      'lang': AppStorage.getLang,
      'Authorization': 'Bearer ${AppStorage.getToken}'
    });
    if (response.statusCode == 200) {
      print("Success showAppDetailsRepo");
      return AppDetailsModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MsgModel> editAppDetails(int appId, String title, String url) async {
    final response = await DioHelper.post(
        "${AppStrings.endpoint_updateAcc}/$appId",
        headers: {
          'Accept-Language': 'application/json',
          'lang': AppStorage.getLang,
          'Authorization': 'Bearer ${AppStorage.getToken}'
        },
        body: {
          "page_title": title,
          "url": url
        });
    if (response.statusCode == 200 && response.data['status'] == true) {
      print("Success editAppDetailsRepo");
      return MsgModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MsgModel> changeStatusApp(int appId, bool status) async {
    int statusId;
    status == true ? statusId = 1 : statusId = 0;
    final response = await DioHelper.post(
        "${AppStrings.endpoint_changeStatus}/$appId",
        headers: {
          'Accept-Language': 'application/json',
          'lang': AppStorage.getLang,
          'Authorization': 'Bearer ${AppStorage.getToken}'
        },
        body: {
          "status": statusId,
        });
    if (response.statusCode == 200 && response.data['status'] == true) {
      print("Success changeStatusAppRepo");
      return MsgModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MsgModel> deleteApp(int appId) async {
    final response =
        await DioHelper.post("${AppStrings.endpoint_deleteAcc}/$appId", headers: {
      'Accept-Language': 'application/json',
      'lang': AppStorage.getLang,
      'Authorization': 'Bearer ${AppStorage.getToken}'
    }, body: {});
    if (response.statusCode == 200) {
      print("Success deleteAppRepo");
      return MsgModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
