import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/view/login/presentation/screens/login_screen.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/validator/validator.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/input_form_field.dart';
import '../../../../widgets/space_height.dart';

class NewPasswordBody extends StatelessWidget {
  const NewPasswordBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: AppSizes.getProportionateScreenHeight(30),
        left: AppSizes.getProportionateScreenWidth(10),
        right: AppSizes.getProportionateScreenWidth(10),
      ),
      child: Column(
        children: [
          Container(
            width: AppSizes.screenWidth,
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: Icon(Icons.language),
              onPressed: () {},
            ),
          ),
          Image.asset(
            AppAssets.logo,
            width: AppSizes.getProportionateScreenHeight(180),
            height: AppSizes.getProportionateScreenHeight(180),
          ),
          Text(
            'Reset Password',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: Colors.black,
            ),
          ),
          InputFormField(
            hint: 'Password',
            validator: Validator.password,
            fillColor: Colors.white,
            icon: Icons.lock_outlined,
            secure: true,
          ),
          InputFormField(
            hint: 'Confirm Password',
            // validator: Validator.confirmPassword(value, password),
            fillColor: Colors.white,
            icon: Icons.lock_outlined,
            secure: true,
          ),
          SpaceH(inputHeigth: 25),
          CustomButton(
            text: 'Confirm',
            onPress: () {
              MagicRouter.navigateAndPopAll(LoginScreen());
            },
          ),
        ],
      ),
    );
  }
}
