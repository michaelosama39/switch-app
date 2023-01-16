import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/core/models/applications_model.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../widgets/space_width.dart';

class AppProfileItem extends StatelessWidget {
  AppProfileItem({Key? key, required this.applicationsData}) : super(key: key);

  final ApplicationsData applicationsData;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.getProportionateScreenWidth(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {},
                ),
                SpaceW(inputWidth: 5),
                Container(
                  width: AppSizes.getProportionateScreenWidth(25),
                  child: Image.network(applicationsData.icon!),
                ),
                SpaceW(inputWidth: 10),
                Text(
                  applicationsData.name!,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Switch(
              activeColor: AppColors.primaryColor,
              value: true,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
