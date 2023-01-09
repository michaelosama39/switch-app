import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/core/utils/app_assets.dart';
import 'package:switch_app/widgets/custom_button.dart';
import 'package:switch_app/widgets/space_height.dart';

import '../../../../core/utils/app_sizes.dart';
import '../../../../localization/language_constants.dart';

class QrCodeBody extends StatelessWidget {
  const QrCodeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: AppSizes.getProportionateScreenHeight(30),
        left: AppSizes.getProportionateScreenWidth(10),
        right: AppSizes.getProportionateScreenWidth(10),
        // bottom: AppSizes.getProportionateScreenHeight(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  MagicRouter.pop();
                },
              ),
              Image.asset(
                AppAssets.logo_without_image,
                height: AppSizes.getProportionateScreenHeight(50),
              ),
              IconButton(
                icon: Icon(Icons.ios_share),
                onPressed: () {},
              ),
            ],
          ),
          SpaceH(inputHeigth: 30),
          Image.asset(
            AppAssets.qr_code,
            height: AppSizes.screenHeight * 0.5,
          ),
          SpaceH(inputHeigth: 20),
          CustomButton(
            text: translation(context).downloadQRCode,
            onPress: () {},
          )
        ],
      ),
    );
  }
}
