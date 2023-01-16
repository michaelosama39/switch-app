import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/core/appStorage/app_storage.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/core/utils/app_colors.dart';
import 'package:switch_app/localization/language_constants.dart';
import 'package:switch_app/view/login/presentation/screens/login_screen.dart';
import 'package:switch_app/view/setting/presentation/controller/setting_cubit.dart';

Future showDialogLogout(context , SettingCubit cubit) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
          child: Text(
            translation(context).logOut,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        content: Text(
          translation(context).areYouSureLogout,
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
              MagicRouter.pop();
            },
          ),
          TextButton(
            child: Text(
              translation(context).ok,
              style: TextStyle(
                color: AppColors.primaryColor,
              ),
            ),
            onPressed: () async{
              cubit.logout();
            },
          ),
        ],
      );
    },
  );
}
