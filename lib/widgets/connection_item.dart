import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/widgets/space_width.dart';
import '../core/utils/app_assets.dart';
import '../core/utils/app_sizes.dart';

class ConnectionItem extends StatelessWidget {
  const ConnectionItem({Key? key, required this.onTapMore}) : super(key: key);

  final Function() onTapMore;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.getProportionateScreenHeight(5),
          horizontal: AppSizes.getProportionateScreenWidth(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: AppSizes.getProportionateScreenWidth(70),
                  height: AppSizes.getProportionateScreenHeight(70),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppAssets.avater),
                    ),
                  ),
                ),
                SpaceW(inputWidth: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dominic Ovo',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'software engineer',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: onTapMore,
            ),
          ],
        ),
      ),
    );
  }
}
