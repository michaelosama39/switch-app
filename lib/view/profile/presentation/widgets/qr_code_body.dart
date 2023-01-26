import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/core/utils/app_assets.dart';
import 'package:switch_app/core/utils/app_enums.dart';
import 'package:switch_app/core/utils/app_func.dart';
import 'package:switch_app/view/editProfile/presentation/controller/edit_profile_cubit.dart';
import 'package:switch_app/widgets/custom_button.dart';
import 'package:switch_app/widgets/loading_indicator.dart';
import 'package:switch_app/widgets/snackBar.dart';
import 'package:switch_app/widgets/space_height.dart';

import '../../../../core/appStorage/app_storage.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../localization/language_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui' as ui;

class QrCodeBody extends StatelessWidget {
  QrCodeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        final cubit = EditProfileCubit.of(context);
        return Container(
          padding: EdgeInsets.only(
            top: AppSizes.getProportionateScreenHeight(30),
            left: AppSizes.getProportionateScreenWidth(10),
            right: AppSizes.getProportionateScreenWidth(10),
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
                    onPressed: () {
                      AppFunc.shareText(
                          text:
                          'https://switch-profile.technomasrsystems.com/${AppStorage.getUserId}');
                    },
                  ),
                ],
              ),
              SpaceH(inputHeigth: 30),
              state is GetProfileLoading
                  ? LoadingIndicator()
                  : Image.network(
                      cubit.userData!.qrcode!,
                      height: AppSizes.screenHeight * 0.5,
                    ),
              SpaceH(inputHeigth: 20),
              CustomButton(
                text: translation(context).shareQRCode,
                onPress: () async {
                  AppFunc.shareText(text: cubit.userData!.qrcode);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
