import 'package:flutter/material.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/core/utils/app_func.dart';
import 'package:switch_app/localization/language_constants.dart';
import 'package:switch_app/view/bottomNav/presentation/screens/bottom_nav_screen.dart';
import 'package:switch_app/view/viewProfile/presentation/controller/view_profile_cubit.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/space_height.dart';
import '../../../profile/presentation/controller/profile_cubit.dart';

class SocialItemsViewProfile extends StatelessWidget {
  const SocialItemsViewProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = ProfileCubit.of(context);

    return Column(
      children: [
        Wrap(
          spacing: AppSizes.getProportionateScreenWidth(25),
          runSpacing: AppSizes.getProportionateScreenWidth(10),
          alignment: WrapAlignment.start,
          children: List.generate(
            cubit.listOfAppDetailsData.length,
            (index) {
              return InkWell(
                onTap: () {
                  AppFunc.launchUrlFun(cubit.listOfAppDetailsData[index].url!);
                },
                child: Container(
                  width: AppSizes.getProportionateScreenWidth(60),
                  child: Image.network(
                      "https://switch.technomasrsystems.com/public/uploads/apps/${cubit.listOfAppDetailsData[index].categoryName}/${cubit.listOfAppDetailsData[index].account!.icon}"),
                ),
              );
            },
          ),
        ),
        SpaceH(inputHeigth: 20),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.getProportionateScreenWidth(40),
          ),
          child: CustomButton(
            text: translation(context).getYourSwitchProduct,
            onPress: () {
              MagicRouter.navigateAndPopAll(BottomNavScreen(
                selectedIndex: 1,
              ));
            },
          ),
        ),
      ],
    );
  }
}
