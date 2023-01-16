import 'package:flutter/material.dart';

import '../../../../core/router/router.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../viewProfile/presentation/screens/view_profile_screen.dart';

class ProfileAppbar extends StatelessWidget {
  const ProfileAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.visibility),
          onPressed: () {
            MagicRouter.navigateTo(ViewProfileScreen());
          },
        ),
        Padding(
          padding: EdgeInsets.only(
              top: AppSizes.getProportionateScreenHeight(5)),
          child: Image.asset(
            AppAssets.logo_without_image,
            width: AppSizes.getProportionateScreenWidth(140),
          ),
        ),
        IconButton(
          icon: Icon(Icons.ios_share),
          onPressed: () {},
        ),
      ],
    );
  }
}
