import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/localization/language_constants.dart';

import '../../../../core/utils/app_colors.dart';
import '../controller/setting_cubit.dart';

Future showDialogDeleteAccount(context , SettingCubit cubit) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
          child: Text(
            translation(context).deleteAccount,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        content: Text(
          translation(context).areYouSureDelete,
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
          translation(context).cancel,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(
              translation(context).ok,
              style: TextStyle(
                color: AppColors.primaryColor,
              ),
            ),
            onPressed: () {
              cubit.deleteAccount();
            },
          ),
        ],
      );
    },
  );
}
