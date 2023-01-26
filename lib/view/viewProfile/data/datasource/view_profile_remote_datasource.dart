import 'dart:convert';
import '../../../../core/appStorage/app_storage.dart';
import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/models/error_message_model.dart';
import '../../../../core/utils/app_strings.dart';
import '../model/app_details_model.dart';

abstract class BaseViewProfileRemoteDatasource {
  Future<AppDetailsModel> showAppDetails();
}

class ViewProfileRemoteDatasource extends BaseViewProfileRemoteDatasource {
  @override
  Future<AppDetailsModel> showAppDetails() async {
    final response = await DioHelper.get(AppStrings.endpoint_show, headers: {
      'Accept-Language': 'application/json',
      'lang': AppStorage.getLang,
      // 'category_name': categoryName,
      'Authorization': 'Bearer ${AppStorage.getUserData.token}'
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
}
