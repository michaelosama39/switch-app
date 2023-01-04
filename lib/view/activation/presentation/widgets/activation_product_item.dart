import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/view/activation/presentation/screens/scan_screen.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_sizes.dart';

class ActivationProductItem extends StatelessWidget {
  const ActivationProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: InkWell(
        onTap: (){
          MagicRouter.navigateTo(ScanScreen());
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.getProportionateScreenWidth(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Switch Sticker',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Image.asset(
                AppAssets.nfc_card,
                width: AppSizes.getProportionateScreenWidth(80),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
