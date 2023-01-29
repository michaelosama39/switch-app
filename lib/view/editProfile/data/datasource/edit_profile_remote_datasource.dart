import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:switch_app/core/appStorage/app_storage.dart';
import 'package:switch_app/core/models/msg_model.dart';
import 'package:switch_app/view/editProfile/data/model/profile_model.dart';

import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/models/error_message_model.dart';
import '../../../../core/utils/app_strings.dart';

abstract class BaseEditProfileRemoteDatasource {
  Future<ProfileModel> getProfileData();

  Future<MsgModel> editImage(XFile image);

  Future<MsgModel> editBackgroundImage(XFile backgroundImage);

  Future<MsgModel> editProfile(
    String name,
    String familyName,
    String email,
    String phone,
    String jobTitle,
    String bio,
  );
}

class EditProfileRemoteDatasource extends BaseEditProfileRemoteDatasource {
  @override
  Future<ProfileModel> getProfileData() async {
    final response = await DioHelper.get(
        "${AppStrings.endpoint_editAccount}/${AppStorage.getUserInfo!.data!.id}",
        headers: {
          'Accept-Language': 'application/json',
          'lang': AppStorage.getLang,
          'Authorization': 'Bearer ${AppStorage.getToken}'
        });
    if (response.statusCode == 200) {
      print("Success getProfileDataRepo");
      return ProfileModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MsgModel> editProfile(
    String name,
    String familyName,
    String email,
    String phone,
    String jobTitle,
    String bio,
  ) async {
    final response = await DioHelper.post(
      AppStrings.endpoint_updateAccount,
      headers: {
        'Accept-Language': 'application/json',
        'lang': AppStorage.getLang,
        'Authorization': 'Bearer ${AppStorage.getToken}',
        'user_id': AppStorage.getUserId,
      },
      body: {
        "name": name,
        "familyName": familyName,
        "email": email,
        "phone": phone,
        "job_title": jobTitle,
        "bio": bio,
      },
    );
    if (response.statusCode == 200) {
      print("Success editProfileRepo");
      return MsgModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MsgModel> editBackgroundImage(backgroundImage) async {
    String namebackgroundImage = backgroundImage.path.split('/').last;

    final response = await DioHelper.post(
      AppStrings.endpoint_updateAccount,
      headers: {
        'Accept-Language': 'application/json',
        'lang': AppStorage.getLang,
        'Authorization': 'Bearer ${AppStorage.getToken}',
        'user_id': AppStorage.getUserId,
      },
      body: {
        "background_image": await MultipartFile.fromFile(backgroundImage.path,
            filename: namebackgroundImage),
      },
    );
    if (response.statusCode == 200) {
      print("Success editBackgroundImageRepo");
      return MsgModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MsgModel> editImage(image) async {
    String nameImage = image.path.split('/').last;
    final response = await DioHelper.post(
      AppStrings.endpoint_updateAccount,
      headers: {
        'Accept-Language': 'application/json',
        'lang': AppStorage.getLang,
        'Authorization': 'Bearer ${AppStorage.getToken}',
        'user_id': AppStorage.getUserId,
      },
      body: {
        "image": await MultipartFile.fromFile(image.path, filename: nameImage),
      },
    );
    if (response.statusCode == 200) {
      print("Success editBackgroundImageRepo");
      return MsgModel.fromJson(jsonDecode(response.toString()));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
