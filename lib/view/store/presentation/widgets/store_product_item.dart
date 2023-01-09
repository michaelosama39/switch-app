import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/localization/language_constants.dart';
import 'package:switch_app/view/activation/presentation/screens/scan_screen.dart';
import 'package:switch_app/view/store/presentation/widgets/show_dialog_book_now.dart';
import 'package:switch_app/widgets/space_height.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../widgets/custom_button.dart';

class StoreProductItem extends StatelessWidget {
  const StoreProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.getProportionateScreenWidth(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  translation(context).switchSticker,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SpaceH(inputHeigth: 10),
                CustomButton(
                  text: translation(context).bookNow,
                  fontColor: Colors.red,
                  buttonColor: Colors.white,
                  borderColor: Colors.red,
                  fontSize: 12.sp,
                  paddingVertical: 3,
                  onPress: () {
                    showDialogBookNow(context);
                  },
                ),
              ],
            ),
            Image.asset(
              AppAssets.nfc_card,
              width: AppSizes.getProportionateScreenWidth(80),
            ),
          ],
        ),
      ),
    );
  }
}
