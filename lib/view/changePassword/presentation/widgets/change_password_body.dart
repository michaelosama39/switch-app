import 'package:flutter/material.dart';
import 'package:switch_app/core/utils/app_colors.dart';
import 'package:switch_app/localization/language_constants.dart';
import 'package:switch_app/widgets/space_height.dart';

import '../../../../core/utils/app_sizes.dart';
import '../../../../core/validator/validator.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/input_form_field.dart';

class ChangePasswordBody extends StatelessWidget {
  const ChangePasswordBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: AppSizes.getProportionateScreenHeight(10),
        left: AppSizes.getProportionateScreenWidth(10),
        right: AppSizes.getProportionateScreenWidth(10),
      ),
      child: Column(
        children: [
          InputFormField(
            hint: translation(context).oldPassword,
            validator: (v)=> Validator.password(context , v),
            fillColor: Colors.white,
            icon: Icons.lock_outlined,
            secure: true,
          ),
          InputFormField(
            hint: translation(context).newPassword,
            validator: (v)=> Validator.password(context , v),
            fillColor: Colors.white,
            icon: Icons.lock_outlined,
            secure: true,
          ),
          InputFormField(
            hint: translation(context).confirmPassword,
            // validator: Validator.confirmPassword(context , value, password),
            fillColor: Colors.white,
            icon: Icons.lock_outlined,
            secure: true,
          ),
          SpaceH(inputHeigth: 30),
          CustomButton(
            text: translation(context).changePassword,
            buttonColor: AppColors.primaryColor,
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
