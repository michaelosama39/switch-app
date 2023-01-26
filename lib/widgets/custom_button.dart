import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/core/utils/app_sizes.dart';

import '../core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.text = '',
    this.fontSize = 14,
    this.fontColor = Colors.white,
    required this.onPress,
    this.radius = 5,
    this.paddingVertical = 10,
    this.paddingHorizontal = 10,
    this.buttonColor = AppColors.primaryColor,
    this.borderColor = Colors.white,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final Color fontColor;
  final VoidCallback onPress;
  final double radius;
  final double paddingVertical;
  final double paddingHorizontal;
  final Color buttonColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.getProportionateScreenWidth(paddingHorizontal),
        vertical: AppSizes.getProportionateScreenHeight(paddingVertical),
      ),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: borderColor),
      ),
      child: InkWell(
        onTap: onPress,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: fontSize.sp,
                color: fontColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
