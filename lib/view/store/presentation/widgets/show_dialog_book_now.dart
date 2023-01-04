import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/core/utils/app_assets.dart';
import 'package:switch_app/core/utils/app_sizes.dart';
import 'package:switch_app/core/validator/validator.dart';
import 'package:switch_app/widgets/custom_button.dart';
import 'package:switch_app/widgets/input_form_field.dart';
import 'package:switch_app/widgets/space_height.dart';

Future showDialogBookNow(context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          height: AppSizes.getProportionateScreenHeight(430),
          width: AppSizes.screenWidth * 0.7,
          color: Colors.white,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.logo_without_image,
                    height: AppSizes.getProportionateScreenHeight(60),
                  ),
                  // Text(
                  //   'Book Now',
                  //   style: TextStyle(
                  //     fontSize: 18.sp,
                  //     color: Colors.black,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  SpaceH(inputHeigth: 10),
                  InputFormField(
                    hint: ' Name',
                    icon: Icons.person,
                    validator: Validator.name,
                  ),
                  InputFormField(
                    hint: '  Phone ',
                    icon: Icons.phone,
                    validator: Validator.phoneNumber,
                  ),
                  InputFormField(
                    hint: ' Adress',
                    icon: Icons.person,
                    validator: Validator.address,
                  ),
                  SpaceH(inputHeigth: 30),
                  CustomButton(
                    text: 'send',
                    onPress: () {
                      MagicRouter.pop();
                    },
                  ),
                ],
              ),
              Positioned(
                top: -10,
                right: -10,
                child: IconButton(
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    MagicRouter.pop();
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
