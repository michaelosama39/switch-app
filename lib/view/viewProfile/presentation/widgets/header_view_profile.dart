import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/localization/language_constants.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../widgets/custom_button.dart';

class HeaderViewProfile extends StatelessWidget {
  const HeaderViewProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppAssets.logo,
          width: AppSizes.getProportionateScreenWidth(115),
        ),
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  right: AppSizes.getProportionateScreenWidth(15),
                  left: AppSizes.getProportionateScreenWidth(15),
                  bottom: AppSizes.getProportionateScreenHeight(35)),
              child: Image.asset(
                AppAssets.background_profile,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: AppSizes.getProportionateScreenWidth(90),
                height: AppSizes.getProportionateScreenHeight(90),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppAssets.avater),
                  ),
                ),
              ),
            ),
          ],
        ),
        Text(
          'Dominic Ovo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 14.sp,
          ),
        ),
        Text(
          'software engineer',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12.sp,
          ),
        ),
        Text(
          'BIO',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12.sp,
          ),
        ),
        CustomButton(
          text: translation(context).connectWithMe,
          onPress: () {},
        ),
      ],
    );
  }
}
