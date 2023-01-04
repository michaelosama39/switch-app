import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/core/utils/app_assets.dart';
import 'package:switch_app/core/utils/app_colors.dart';
import 'package:switch_app/core/utils/app_sizes.dart';
import 'package:switch_app/core/validator/validator.dart';
import 'package:switch_app/view/login/presentation/screens/login_screen.dart';
import 'package:switch_app/widgets/custom_button.dart';
import 'package:switch_app/widgets/space_height.dart';
import '../../../../widgets/input_form_field.dart';
import '../../../bottomNav/presentation/screens/bottom_nav_screen.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          top: AppSizes.getProportionateScreenHeight(15),
          left: AppSizes.getProportionateScreenWidth(10),
          right: AppSizes.getProportionateScreenWidth(10),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      right: AppSizes.getProportionateScreenWidth(15),
                      left: AppSizes.getProportionateScreenWidth(15),
                      bottom: AppSizes.getProportionateScreenHeight(35)),
                  child: Stack(
                    children: [
                      Image.asset(
                        AppAssets.background_profile,
                      ),
                      Positioned(
                        right: 0,
                        child: IconButton(
                          icon: Icon(
                            FontAwesomeIcons.camera,
                            color: Colors.grey,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          width: AppSizes.getProportionateScreenWidth(120),
                          height: AppSizes.getProportionateScreenHeight(120),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(AppAssets.avater),
                            ),
                          ),
                        ),
                        Positioned(
                          right: -3,
                          bottom: -5,
                          child: IconButton(
                            icon: Icon(
                              FontAwesomeIcons.camera,
                              color: Colors.grey,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            InputFormField(
              hint: 'Dominic Ovo',
              validator: Validator.name,
              fillColor: Colors.white,
              icon: Icons.person,
            ),
            InputFormField(
              hint: 'test@gmail.com',
              validator: Validator.email,
              fillColor: Colors.white,
              icon: Icons.email_outlined,
            ),
            InputFormField(
              hint: '01000000000',
              validator: Validator.phoneNumber,
              fillColor: Colors.white,
              icon: Icons.phone,
            ),
            InputFormField(
              hint: 'software engineer',
              validator: Validator.productTitle,
              fillColor: Colors.white,
              icon: Icons.receipt,
            ),
            InputFormField(
              hint: 'Bio',
              validator: Validator.productTitle,
              fillColor: Colors.white,
              icon: Icons.wysiwyg_rounded,
            ),
            SpaceH(inputHeigth: 25),
            CustomButton(
              text: 'save profile',
              onPress: () {},
            ),
            SpaceH(inputHeigth: 10),
            CustomButton(
              text: 'cancel',
              fontColor: AppColors.primaryColor,
              buttonColor: Colors.white,
              borderColor: AppColors.primaryColor,
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}
