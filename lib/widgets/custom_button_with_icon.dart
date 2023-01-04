import 'package:flutter/material.dart';
import '../core/utils/app_colors.dart';

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon({
    Key? key,
    this.text = '',
    this.fontSize = 16,
    this.fontColor = Colors.white,
    required this.onPress,
    this.radius = 5,
    this.buttonColor = AppColors.primaryColor,
    required this.icon,
    required this.colorIcon,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final Color fontColor;
  final VoidCallback onPress;
  final double radius;
  final Color buttonColor;
  final IconData icon;
  final Color colorIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: Colors.white),
      ),
      child: InkWell(
        onTap: onPress,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: colorIcon,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: fontSize,
                  color: fontColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
