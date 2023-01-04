import 'package:flutter/material.dart';
import 'package:switch_app/view/viewProfile/presentation/widgets/header_view_profile.dart';
import 'package:switch_app/view/viewProfile/presentation/widgets/social_items_view_profile.dart';
import 'package:switch_app/widgets/space_height.dart';
import '../../../../core/utils/app_sizes.dart';

class ViewProfileBody extends StatelessWidget {
  const ViewProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          left: AppSizes.getProportionateScreenWidth(10),
          right: AppSizes.getProportionateScreenWidth(10),
          bottom: AppSizes.getProportionateScreenHeight(30),
        ),
        child: Column(
          children: [
            HeaderViewProfile(),
            SpaceH(inputHeigth: 10),
            SocialItemsViewProfile()
          ],
        ),
      ),
    );
  }
}
