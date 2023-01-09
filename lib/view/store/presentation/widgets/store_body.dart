import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/core/utils/app_assets.dart';
import 'package:switch_app/localization/language_constants.dart';
import 'package:switch_app/view/activation/presentation/widgets/activation_product_item.dart';
import 'package:switch_app/view/store/presentation/widgets/store_product_item.dart';

import '../../../../core/utils/app_sizes.dart';

class StoreBody extends StatelessWidget {
  const StoreBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: AppSizes.getProportionateScreenHeight(30),
        left: AppSizes.getProportionateScreenWidth(10),
        right: AppSizes.getProportionateScreenWidth(10),
      ),
      child: Column(
        children: [
          Container(
            width: AppSizes.screenWidth,
            alignment: Alignment.centerLeft,
            child: Text(
              translation(context).switchProducts,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return StoreProductItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}
