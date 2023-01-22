import 'dart:convert';

import 'package:switch_app/core/models/msg_model.dart';

import '../../../../core/appStorage/app_storage.dart';
import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/models/error_message_model.dart';
import '../../../../core/utils/app_strings.dart';
import '../model/products_model.dart';

abstract class BaseStoreRemoteDatasource {
  Future<ProductsModel> getAllProducts();

  Future<MsgModel> makeOrder(int productId);
}

class StoreRemoteDatasource extends BaseStoreRemoteDatasource {
  @override
  Future<ProductsModel> getAllProducts() async {
    final response =
        await DioHelper.get(AppStrings.endpoint_products, headers: {
      'Accept-Language': 'application/json',
      'lang': AppStorage.getLang,
      'Authorization': 'Bearer ${AppStorage.getUserData.token}'
    });
    if (response.statusCode == 200 && response.data['status'] == true) {
      print("Success getAllProductsRepo");
      return ProductsModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MsgModel> makeOrder(int productId) async {
    final response = await DioHelper.post(
      AppStrings.endpoint_makeOrder,
      body: {'product_id': productId},
      headers: {
        'Accept-Language': 'application/json',
        'lang': AppStorage.getLang,
        'Authorization': 'Bearer ${AppStorage.getUserData.token}',
        'user': AppStorage.getUserId
      },
    );
    if (response.statusCode == 200 && response.data['status'] == true) {
      print("Success makeOrderRepo");
      return MsgModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
