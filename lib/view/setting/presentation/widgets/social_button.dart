import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key? key,
    required this.img,
    required this.imgColor,
    required this.onPress,
    this.radius = 12,
    this.buttonColor = Colors.amberAccent,
    this.borderColor = Colors.white,
  }) : super(key: key);

  final String img;
  final VoidCallback onPress;
  final double radius;
  final Color buttonColor;
  final Color borderColor;
  final Color imgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: buttonColor,
        shape: BoxShape.circle
      ),
      child: InkWell(
        onTap: onPress,
        child: Image.asset(
          img,
          color: imgColor,
          width: 25,
          height: 25,
        ),
      ),
    );
  }
}