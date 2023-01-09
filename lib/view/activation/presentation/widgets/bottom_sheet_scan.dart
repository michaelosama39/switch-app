import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/core/utils/app_assets.dart';
import 'package:switch_app/localization/language_constants.dart';
import 'package:switch_app/widgets/space_height.dart';

import '../../../../core/utils/app_sizes.dart';
import '../../../../widgets/custom_button.dart';

void bottomSheetScan(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        height: AppSizes.getProportionateScreenHeight(260),
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.getProportionateScreenHeight(10),
          horizontal: AppSizes.getProportionateScreenWidth(5),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              translation(context).readyToScan,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
            SpaceH(inputHeigth: 15),
            Image.asset(
              AppAssets.move_img,
              height: AppSizes.getProportionateScreenHeight(55),
            ),
            SpaceH(inputHeigth: 10),
            Text(
              translation(context).holdNearYourProdut,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
              ),
            ),
            SpaceH(inputHeigth: 10),
            CustomButton(
              text: translation(context).cancel,
              onPress: () {},
            ),
          ],
        ),
      );
    },
  );
}
