import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/core/utils/app_sizes.dart';
import 'package:switch_app/widgets/custom_button.dart';
import 'package:switch_app/widgets/input_form_field.dart';
import 'package:switch_app/widgets/space_height.dart';

Future showDialogAddLink(context, IconData icon) {
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
                children: [
                  SpaceH(inputHeigth: 15),
                  Icon(
                    icon,
                    size: 60,
                  ),
                  Text(
                    'facebook',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SpaceH(inputHeigth: 20),
                  InputFormField(
                    hint: 'page title',
                  ),
                  InputFormField(
                    hint: 'URL',
                  ),
                  SpaceH(inputHeigth: 30),
                  CustomButton(
                    text: 'save',
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
