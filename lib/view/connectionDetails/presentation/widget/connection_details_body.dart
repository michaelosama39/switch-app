import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/core/utils/app_func.dart';
import 'package:switch_app/widgets/space_height.dart';
import 'package:switch_app/widgets/space_width.dart';
import '../../../../core/router/router.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../localization/language_constants.dart';
import '../../../../widgets/custom_button.dart';
import '../../../bottomNav/presentation/screens/bottom_nav_screen.dart';
import '../../../myConnections/data/model/connection_model.dart';

class ConnectionDetailsBody extends StatelessWidget {
  ConnectionDetailsBody({Key? key, required this.getData}) : super(key: key);

  final ConnectionData getData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          left: AppSizes.getProportionateScreenWidth(10),
          right: AppSizes.getProportionateScreenWidth(10),
          bottom: AppSizes.getProportionateScreenHeight(30),
        ),
        child: Column(
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
                  child: SizedBox(
                    width: AppSizes.screenWidth,
                    child: Image.asset(
                      AppAssets.background_profile,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: AppSizes.getProportionateScreenWidth(100),
                    height: AppSizes.getProportionateScreenWidth(100),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          AppAssets.avater,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              getData.name == null ? '' : getData.name!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 14.sp,
              ),
            ),
            Text(
              getData.title == null ? '' : getData.title!,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12.sp,
              ),
            ),
            Text(
              getData.subject == null ? '' : getData.subject!,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12.sp,
              ),
            ),
            CustomButton(
              text: translation(context).connectWithMe,
              onPress: () {},
            ),
            SpaceH(inputHeigth: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.phone,
                    size: 50.sp,
                  ),
                  onPressed: () {
                    AppFunc.launchUrlFun('tel:+2${getData.phone}');
                  },
                ),
                SpaceW(inputWidth: 30),
                IconButton(
                  icon: Icon(
                    Icons.email,
                    size: 50.sp,
                  ),
                  onPressed: () {
                    AppFunc.launchUrlFun('mailto:${getData.email}');
                  },
                ),
              ],
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
        ),
      ),
    );
  }
}
