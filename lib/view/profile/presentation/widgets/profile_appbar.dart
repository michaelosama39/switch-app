import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switch_app/core/appStorage/app_storage.dart';
import 'package:switch_app/core/utils/app_func.dart';
import 'package:switch_app/view/profile/presentation/controller/profile_cubit.dart';

import '../../../../core/router/router.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../viewProfile/presentation/screens/view_profile_screen.dart';

class ProfileAppbar extends StatelessWidget {
  const ProfileAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final cubit = ProfileCubit.of(context);
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
              onPressed: () {
                print(cubit.listOfAllApps.first.account!.name);
                AppFunc.shareText(
                    text: cubit.isDircect
                        ? cubit.listOfAllApps.first.url!
                        : 'https://switch-profile.technomasrsystems.com/${AppStorage.getUserId}');
              },
            ),
          ],
        );
      },
    );
  }
}
