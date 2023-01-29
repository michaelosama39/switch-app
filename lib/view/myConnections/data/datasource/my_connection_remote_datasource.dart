import 'dart:convert';
import 'package:switch_app/core/models/msg_model.dart';
import '../../../../core/appStorage/app_storage.dart';
import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/models/error_message_model.dart';
import '../../../../core/utils/app_strings.dart';
import '../model/connection_model.dart';

abstract class BaseMyConnectionRemoteDatasource {
  Future<MsgModel> exchangeStatus(int exchangeId, int status);

  Future<ConnectionModel> getExchangeList();

  Future<ConnectionModel> getConnectionList();

  Future<MsgModel> addNewConnection(
      String name, String email, String title, String phone, String content);

  Future<MsgModel> favouriteStatus(int connectionId, int status);

  Future<ConnectionModel> getFavouriteList();

  Future<MsgModel> deleteUserConnection(int connectionId);
}

class MyConnectionRemoteDatasource extends BaseMyConnectionRemoteDatasource {
  @override
  Future<MsgModel> exchangeStatus(exchangeId, status) async {
    final response = await DioHelper.post(
      "${AppStrings.endpoint_exchangeStatus}/$exchangeId",
      headers: {
        'Accept-Language': 'application/json',
        'lang': AppStorage.getLang,
        'user': AppStorage.getUserId
      },
      body: {
        "status": status,
      },
    );
    if (response.statusCode == 200 && response.data['status'] == true) {
      print("Success ExchangeStatusRepo");
      return MsgModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<ConnectionModel> getExchangeList() async {
    final response = await DioHelper.get(
      AppStrings.endpoint_exchange,
      headers: {
        'Accept-Language': 'application/json',
        'lang': AppStorage.getLang,
        'user': AppStorage.getUserId
      },
    );
    if (response.statusCode == 200 && response.data['status'] == true) {
      print("Success getExchangeListRepo");
      return ConnectionModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<ConnectionModel> getConnectionList() async {
    final response = await DioHelper.get(
      AppStrings.endpoint_userconnection,
      headers: {
        'Accept-Language': 'application/json',
        'lang': AppStorage.getLang,
        'user': AppStorage.getUserId
      },
    );
    if (response.statusCode == 200 && response.data['status'] == true) {
      print("Success getConnectionListRepo");
      return ConnectionModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MsgModel> addNewConnection(name, email, title, phone, content) async {
    final response = await DioHelper.get(
      "${AppStrings.endpoint_sendmessage}?name=$name&email=$email&title=$title&phone=$phone&content=$content&status=1",
      headers: {
        'Accept-Language': 'application/json',
        'lang': AppStorage.getLang,
        'user': AppStorage.getUserId
      },
    );
    if (response.statusCode == 200 && response.data['status'] == true) {
      print("Success AddNewConnectionRepo");
      return MsgModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MsgModel> favouriteStatus(connectionId, status) async {
    final response = await DioHelper.post(
      "${AppStrings.endpoint_favorite}/$connectionId",
      headers: {
        'Accept-Language': 'application/json',
        'lang': AppStorage.getLang,
        'user': AppStorage.getUserId
      },
      body: {
        "fav": status,
      },
    );
    if (response.statusCode == 200 && response.data['status'] == true) {
      print("Success FavouriteStatusRepo");
      return MsgModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<ConnectionModel> getFavouriteList() async {
    final response = await DioHelper.get(
      AppStrings.endpoint_favoriteShow,
      headers: {
        'Accept-Language': 'application/json',
        'lang': AppStorage.getLang,
        'user': AppStorage.getUserId
      },
    );
    if (response.statusCode == 200 && response.data['status'] == true) {
      print("Success getFavouriteListRepo");
      return ConnectionModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MsgModel> deleteUserConnection(int connectionId) async {
    final response = await DioHelper.post(
      "${AppStrings.endpoint_deleteUserConnection}/$connectionId",
      headers: {
        'Accept-Language': 'application/json',
        'lang': AppStorage.getLang,
      },
      body: {},
    );
    if (response.statusCode == 200 && response.data['status'] == true) {
      print("Success DeleteUserConnectionRepo");
      return MsgModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
