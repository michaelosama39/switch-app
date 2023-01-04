import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/view/forgetPassword/presentation/screens/new_password_screen.dart';
import '../../../../core/router/router.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/validator/validator.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/input_form_field.dart';
import '../../../../widgets/space_height.dart';

class VerficationCodeBody extends StatelessWidget {
  const VerficationCodeBody({Key? key}) : super(key: key);

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
            'Verify Your Account',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: Colors.black,
            ),
          ),
          Text(
            'check your Email',
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey,
            ),
          ),
          InputFormField(
            hint: 'Enter code here',
            validator: Validator.pinCode,
            fillColor: Colors.white,
            icon: Icons.code,
          ),
          SpaceH(inputHeigth: 25),
          CustomButton(
            text: 'Verify',
            onPress: () {
              MagicRouter.navigateTo(NewPasswordScreen());
            },
          ),
        ],
      ),
    );
  }
}
