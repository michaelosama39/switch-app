import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/localization/language_constants.dart';
import 'package:switch_app/view/activation/presentation/screens/scan_screen.dart';
import 'package:switch_app/view/store/data/model/products_model.dart';
import 'package:switch_app/view/store/presentation/widgets/show_dialog_book_now.dart';
import 'package:switch_app/widgets/space_height.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../widgets/custom_button.dart';
import '../controller/store_cubit.dart';

class StoreProductItem extends StatelessWidget {
  StoreProductItem({Key? key, required this.productsData}) : super(key: key);

  final ProductsData productsData;

  @override
  Widget build(BuildContext context) {
    final cubit = StoreCubit.of(context);
    return Card(
      elevation: 0,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppSizes.getProportionateScreenWidth(10),
            vertical: AppSizes.getProportionateScreenHeight(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: AppSizes.getProportionateScreenHeight(110),
              child: Image.network(
                productsData.image!,
                width: AppSizes.getProportionateScreenWidth(80),
              ),
            ),
            Column(
              children: [
                Text(
                  productsData.productName!,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SpaceH(inputHeigth: 5),
                Text(
                  "${productsData.price!} LE",
                  style: TextStyle(
                    fontSize: 14.sp,
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
                    showDialogBookNow(context, cubit, productsData.id!);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
