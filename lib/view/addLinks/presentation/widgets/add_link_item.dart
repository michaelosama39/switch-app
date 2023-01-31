import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/models/applications_model.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../localization/language_constants.dart';
import '../../../../widgets/space_width.dart';

class AddLinkItem extends StatelessWidget {
  AddLinkItem({Key? key, required this.onTap, required this.applicationsData})
      : super(key: key);
  final Function() onTap;
  final ApplicationsData applicationsData;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        width: AppSizes.screenWidth * 0.7,
        height: AppSizes.getProportionateScreenHeight(50),
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.getProportionateScreenHeight(10),
          horizontal: AppSizes.getProportionateScreenWidth(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: AppSizes.getProportionateScreenWidth(30),
                  child: Image.network(applicationsData.icon!),
                ),
                SpaceW(inputWidth: 5),
                Text(
                  applicationsData.name!,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: onTap,
              child: Row(
                children: [
                  Icon(
                    Icons.add_circle,
                    color: Colors.grey,
                  ),
                  SpaceW(inputWidth: 5),
                  Text(
                    translation(context).add,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
