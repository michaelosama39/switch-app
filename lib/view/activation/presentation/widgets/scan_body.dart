import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/core/utils/app_assets.dart';
import 'package:switch_app/localization/language_constants.dart';
import 'package:switch_app/view/activation/presentation/widgets/activation_product_item.dart';
import 'package:switch_app/view/bottomNav/presentation/screens/bottom_nav_screen.dart';
import 'package:switch_app/widgets/custom_button.dart';
import 'package:switch_app/widgets/space_height.dart';

import '../../../../core/utils/app_sizes.dart';
import '../../../editProfile/presentation/controller/edit_profile_cubit.dart';
import '../controller/activation_cubit.dart';
import 'bottom_sheet_scan.dart';

class ScanBody extends StatelessWidget {
  const ScanBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = ActivationCubit.of(context);
    return Column(
      children: [
        Expanded(
          child: Image.asset(AppAssets.nfc_card_ex),
        ),
        SpaceH(inputHeigth: 5),
        Container(
          padding: EdgeInsets.only(
            left: AppSizes.getProportionateScreenWidth(10),
            right: AppSizes.getProportionateScreenWidth(10),
          ),
          child: Column(
            children: [
              Text(
                translation(context).yourSwitchCardWillActivatedFor,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey,
                ),
              ),
              SpaceH(inputHeigth: 5),
              BlocBuilder<EditProfileCubit, EditProfileState>(
                builder: (context, state) {
                  final editProfileCubit = EditProfileCubit.of(context);
                  return editProfileCubit.userData == null
                      ? const SizedBox()
                      : Text(
                          editProfileCubit.userData!.user!.name == null
                              ? 'name'
                              : editProfileCubit.userData!.user!.name!,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black,
                          ),
                        );
                },
              ),
              SpaceH(inputHeigth: 5),
              CustomButton(
                text: translation(context).beginActivate,
                onPress: () {
                  bottomSheetScan(context);
                  cubit.tagNFCRead();
                },
              ),
              CustomButton(
                text: 'Or Buy a New One',
                fontColor: Colors.black,
                buttonColor: Colors.white,
                onPress: () {
                  MagicRouter.navigateAndPopAll(BottomNavScreen(
                    selectedIndex: 1,
                  ));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
