import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/core/utils/app_sizes.dart';
import 'package:switch_app/localization/language_constants.dart';

import '../../data/model/connection_model.dart';
import '../controller/my_connections_cubit.dart';

void bottomSheetConnection(
    BuildContext context, MyConnectionsCubit cubit, ConnectionData getData) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        height: AppSizes.getProportionateScreenHeight(230),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            TextButton(
              child: Text(
                translation(context).addToFavorite,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
              onPressed: () {
                cubit.favouriteStatus(getData.id!, 1);
              },
            ),
            Divider(),
            TextButton(
              child: Text(
                translation(context).removeFromContacts,
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
              onPressed: () {
                cubit.deleteConnection(getData.id!);
              },
            ),
            Divider(),
            TextButton(
              child: Text(
                translation(context).cancel,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
              onPressed: () {
                MagicRouter.pop();
              },
            ),
          ],
        ),
      );
    },
  );
}
