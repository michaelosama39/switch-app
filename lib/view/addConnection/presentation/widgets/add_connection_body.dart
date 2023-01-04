import 'package:flutter/material.dart';
import 'package:switch_app/core/utils/app_colors.dart';
import 'package:switch_app/widgets/space_height.dart';

import '../../../../core/router/router.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/validator/validator.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/input_form_field.dart';

class AddConnectionBody extends StatelessWidget {
  const AddConnectionBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.screenWidth,
      padding: EdgeInsets.only(
        top: AppSizes.getProportionateScreenHeight(30),
        left: AppSizes.getProportionateScreenWidth(10),
        right: AppSizes.getProportionateScreenWidth(10),
      ),
      child: Column(
        children: [
          Container(
            width: AppSizes.getProportionateScreenWidth(90),
            height: AppSizes.getProportionateScreenHeight(90),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
              image: DecorationImage(
                image: AssetImage(AppAssets.avater),
              ),
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
            hint: 'Your Phone',
            validator: Validator.phoneNumber,
            fillColor: Colors.white,
            icon: Icons.phone,
          ),
          InputFormField(
            hint: 'Jop Description',
            validator: Validator.report,
            fillColor: Colors.white,
            icon: Icons.phone,
          ),
          SpaceH(inputHeigth: 20),
          CustomButton(
            text: 'Add',
            onPress: () {},
          ),
          SpaceH(inputHeigth: 10),
          CustomButton(
            text: 'cancel',
            buttonColor: Colors.white,
            fontColor: AppColors.primaryColor,
            borderColor: AppColors.primaryColor,
            onPress: () {
              MagicRouter.pop();
            },
          ),
        ],
      ),
    );
  }
}
