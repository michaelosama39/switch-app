import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/core/utils/app_colors.dart';
import 'package:switch_app/localization/language_constants.dart';
import '../../../viewProfile/presentation/controller/view_profile_cubit.dart';

class AddLinksAppBar extends StatelessWidget with PreferredSizeWidget {
  AddLinksAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      title: Text(
        translation(context).applications,
        style: TextStyle(
          fontSize: 17.sp,
          // color: AppColors.primaryColor,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
