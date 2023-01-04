import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:switch_app/core/utils/app_sizes.dart';

class SocialItem extends StatelessWidget {
  const SocialItem({
    Key? key,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  final String image;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black26,
            ),
            borderRadius: BorderRadius.circular(5)),
        child: Image.asset(
          image,
          width: AppSizes.getProportionateScreenWidth(30),
          height: AppSizes.getProportionateScreenHeight(30),
        ),
      ),
    );
  }
}
