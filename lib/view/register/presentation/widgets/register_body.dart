import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

class RegisterBody extends StatelessWidget {
  const RegisterBody({Key? key}) : super(key: key);

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
            'Let’s Get Started',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: Colors.black,
            ),
          ),
          Text(
            'Create an new account',
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey,
            ),
          ),
          InputFormField(
            hint: 'Full Name',
            validator: Validator.name,
            fillColor: Colors.white,
            icon: Icons.person,
          ),
          InputFormField(
            hint: 'Your Email',
            validator: Validator.email,
            fillColor: Colors.white,
            icon: Icons.email_outlined,
          ),
          InputFormField(
            hint: 'Your Phone ',
            validator: Validator.phoneNumber,
            fillColor: Colors.white,
            icon: Icons.phone,
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
            text: 'Sign Up',
            onPress: () {
              MagicRouter.navigateAndPopAll(BottomNavScreen());
            },
          ),
          SpaceH(inputHeigth: 10),
          InkWell(
            onTap: () {
              MagicRouter.navigateAndReplacement(LoginScreen());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'have a account?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  ' Sign In',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
