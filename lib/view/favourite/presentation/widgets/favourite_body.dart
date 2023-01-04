import 'package:flutter/material.dart';

import '../../../../core/utils/app_sizes.dart';
import '../../../../widgets/connection_item.dart';

class FavouriteBody extends StatelessWidget {
  const FavouriteBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: AppSizes.getProportionateScreenHeight(10),
        left: AppSizes.getProportionateScreenWidth(10),
        right: AppSizes.getProportionateScreenWidth(10),
      ),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ConnectionItem(
            onTapMore: () {},
          );
        },
      ),
    );
  }
}
