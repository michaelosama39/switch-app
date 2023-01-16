import 'package:flutter/material.dart';
import 'package:switch_app/core/utils/app_colors.dart';
import 'package:switch_app/localization/language_constants.dart';
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
            hint: translation(context).name,
            validator: (v)=> Validator.name(context , v),
            fillColor: Colors.white,
            icon: Icons.person,
          ),
          InputFormField(
            hint: translation(context).yourEmail,
            validator: (v)=> Validator.email(context , v),
            fillColor: Colors.white,
            icon: Icons.email_outlined,
          ),
          InputFormField(
            hint: translation(context).yourPhone,
            validator: (v)=> Validator.phoneNumber(context , v),
            fillColor: Colors.white,
            icon: Icons.phone,
          ),
          InputFormField(
            hint: translation(context).jopDescription,
            validator: (v)=> Validator.report(context , v),
            fillColor: Colors.white,
            icon: Icons.phone,
          ),
          SpaceH(inputHeigth: 20),
          CustomButton(
            text: translation(context).add,
            onPress: () {},
          ),
          SpaceH(inputHeigth: 10),
          CustomButton(
            text: translation(context).cancel,
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
