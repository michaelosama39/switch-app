import 'dart:convert';
import 'package:switch_app/core/models/applications_model.dart';
import '../../../../core/appStorage/app_storage.dart';
import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/models/error_message_model.dart';
import '../../../../core/models/msg_model.dart';
import '../../../../core/utils/app_strings.dart';

abstract class BaseAddLinksRemoteDatasource {
  Future<ApplicationsModel> getSocialApps();

  Future<ApplicationsModel> getMusicApps();

  Future<ApplicationsModel> getCreativeApps();

  Future<ApplicationsModel> getBusinessApps();

  Future<MsgModel> addLink(
      String pageTitle, String url, String categoryName, int typeId);
}

class AddLinksRemoteDatasource extends BaseAddLinksRemoteDatasource {
  @override
  Future<ApplicationsModel> getSocialApps() async {
    final response = await DioHelper.get(AppStrings.endpoint_social, headers: {
      'Accept-Language': 'application/json',
      'lang': AppStorage.getLang,
      'Authorization': 'Bearer ${AppStorage.getUserData.token}'
    });
    if (response.statusCode == 200) {
      print("Success getSocialAppsRepo");
      return ApplicationsModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<ApplicationsModel> getBusinessApps() async {
    final response =
        await DioHelper.get(AppStrings.endpoint_business, headers: {
      'Accept-Language': 'application/json',
      'lang': AppStorage.getLang,
      'Authorization': 'Bearer ${AppStorage.getUserData.token}'
    });
    if (response.statusCode == 200) {
      print("Success getBusinessAppsRepo");
      return ApplicationsModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<ApplicationsModel> getCreativeApps() async {
    final response =
        await DioHelper.get(AppStrings.endpoint_creative, headers: {
      'Accept-Language': 'application/json',
      'lang': AppStorage.getLang,
      'Authorization': 'Bearer ${AppStorage.getUserData.token}'
    });
    if (response.statusCode == 200) {
      print("Success getCreativeAppsRepo");
      return ApplicationsModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<ApplicationsModel> getMusicApps() async {
    final response = await DioHelper.get(AppStrings.endpoint_music, headers: {
      'Accept-Language': 'application/json',
      'lang': AppStorage.getLang,
      'Authorization': 'Bearer ${AppStorage.getUserData.token}'
    });
    if (response.statusCode == 200) {
      print("Success getMusicAppsRepo");
      return ApplicationsModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MsgModel> addLink(
      String pageTitle, String url, String categoryName, int typeId) async {
    final response =
        await DioHelper.post(AppStrings.endpoint_addAccount, headers: {
      'Accept-Language': 'application/json',
      'lang': AppStorage.getLang,
      'Authorization': 'Bearer ${AppStorage.getUserData.token}'
    }, body: {
      'page_title': pageTitle,
      'url': url,
      'user_id': AppStorage.getUserId.toString(),
      'category_name': categoryName,
      'type_id': typeId,
    });
    if (response.statusCode == 200 && response.data['status'] == true) {
      print("Success addLinkRepo");
      return MsgModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
