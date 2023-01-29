import 'package:flutter/material.dart';
import 'package:switch_app/core/utils/app_sizes.dart';

import '../../../../core/utils/app_assets.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.screenWidth,
      height: AppSizes.screenHeight,
      color: Colors.white,
      child: Image.asset(
        AppAssets.logo_gif,
      ),
    );
  }
}
