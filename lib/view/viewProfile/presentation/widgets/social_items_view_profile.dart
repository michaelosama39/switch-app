import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/view/bottomNav/presentation/screens/bottom_nav_screen.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/space_height.dart';

class SocialItemsViewProfile extends StatelessWidget {
  const SocialItemsViewProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: AppSizes.getProportionateScreenWidth(10),
          runSpacing: AppSizes.getProportionateScreenWidth(10),
          alignment: WrapAlignment.start,
          children: List.generate(
            6,
                (index) {
              return InkWell(
                onTap: () {},
                child: Icon(
                  FontAwesomeIcons.facebook,
                  size: 70.sp,
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
            text: 'get your switch product',
            onPress: () {
              MagicRouter.navigateAndPopAll(BottomNavScreen(selectedIndex: 1,));
            },
          ),
        ),
      ],
    );
  }
}
