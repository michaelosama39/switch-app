import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

Future showDialogDeleteAccount(context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
          child: Text(
            'Delete Account',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        content: Text(
          'Are You Sure ?\nthis will delete all of your connections, profiledata, and any othersettings',
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'cancel',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text(
              'ok',
              style: TextStyle(
                color: AppColors.primaryColor,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
