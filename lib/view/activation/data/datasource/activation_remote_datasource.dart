import 'dart:convert';
import 'package:switch_app/core/models/msg_model.dart';
import '../../../../core/appStorage/app_storage.dart';
import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/models/error_message_model.dart';
import '../../../../core/utils/app_strings.dart';
import '../model/orders_model.dart';

abstract class BaseActivationRemoteDatasource {
  Future<OrdersModel> getOrders();
}

class ActivationRemoteDatasource extends BaseActivationRemoteDatasource {
  @override
  Future<OrdersModel> getOrders() async {
    final response =
        await DioHelper.get(AppStrings.endpoint_orders, headers: {
      'Accept-Language': 'application/json',
      'lang': AppStorage.getLang,
      'Authorization': 'Bearer ${AppStorage.getUserData.token}'
    });
    if (response.statusCode == 200 && response.data['status'] == 'Success') {
      print("Success getOrdersRepo");
      return OrdersModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
