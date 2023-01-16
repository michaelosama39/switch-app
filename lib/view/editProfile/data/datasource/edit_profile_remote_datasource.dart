import 'dart:convert';
import 'dart:math';

import 'package:switch_app/core/appStorage/app_storage.dart';
import 'package:switch_app/core/models/msg_model.dart';
import 'package:switch_app/core/models/user_model.dart';
import 'package:switch_app/view/editProfile/data/model/profile_model.dart';

import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/models/error_message_model.dart';
import '../../../../core/utils/app_strings.dart';

abstract class BaseEditProfileRemoteDatasource {
  Future<ProfileModel> getProfileData();

  Future<MsgModel> editProfile(String name,
      String familyName,
      String email,
      String phone,
      String jobTitle,
      String bio,
      String image,
      String backgroundImage,);
}

class EditProfileRemoteDatasource extends BaseEditProfileRemoteDatasource {
  @override
  Future<ProfileModel> getProfileData() async {
    final response = await DioHelper.get(
        "${AppStrings.endpoint_editAccount}/${AppStorage.getUserInfo!.user!
            .id}",
        headers: {
          'Accept-Language': 'application/json',
          'lang': AppStorage.getLang,
          'Authorization': 'Bearer ${AppStorage.getUserData.token}'
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
  Future<MsgModel> editProfile(String name,
      String familyName,
      String email,
      String phone,
      String jobTitle,
      String bio,
      String image,
      String backgroundImage) async {
    final response = await DioHelper.post(
        AppStrings.endpoint_updateAccount,
        headers: {
          'Accept-Language': 'application/json',
          'lang': AppStorage.getLang,
          'Authorization': 'Bearer ${AppStorage.getUserData.token}',
          'user_id': AppStorage.getUserId,
        },
        body: {
          "name": name,
          "familyName": familyName,
          "email": email,
          "phone": phone,
          "job_title": jobTitle,
          "bio": bio,
          "image": image,
          "background_image": backgroundImage
        }
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
}
