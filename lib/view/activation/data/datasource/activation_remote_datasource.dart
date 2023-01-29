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

  Future<MsgModel> activationProduct(String serialNumber);
}

class ActivationRemoteDatasource extends BaseActivationRemoteDatasource {
  @override
  Future<OrdersModel> getOrders() async {
    final response = await DioHelper.get(AppStrings.endpoint_orders, headers: {
      'Accept-Language': 'application/json',
      'lang': AppStorage.getLang,
      'Authorization': 'Bearer ${AppStorage.getToken}'
    });
    if (response.statusCode == 200 && response.data['status'] == true) {
      print("Success getOrdersRepo");
      return OrdersModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MsgModel> activationProduct(serialNumber) async {
    final response = await DioHelper.post(
      AppStrings.endpoint_serialNumber,
      headers: {
        'Accept-Language': 'application/json',
        'lang': AppStorage.getLang,
        'Authorization': 'Bearer ${AppStorage.getToken}'
      },
      body: {
        "serialNumber": serialNumber,
      },
    );
    if (response.statusCode == 200 && response.data['status'] == true) {
      print("Success getOrdersRepo");
      return MsgModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
