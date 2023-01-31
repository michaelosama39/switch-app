import 'package:flutter/material.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/core/utils/app_assets.dart';
import 'package:switch_app/core/utils/app_sizes.dart';
import 'package:switch_app/localization/language_constants.dart';
import 'package:switch_app/view/store/presentation/controller/store_cubit.dart';
import 'package:switch_app/widgets/custom_button.dart';
import 'package:switch_app/widgets/space_height.dart';

import '../../data/model/products_model.dart';

Future showDialogBookNow(context, StoreCubit cubit, ProductsData productsData) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          height: AppSizes.getProportionateScreenHeight(430),
          width: AppSizes.screenWidth * 0.7,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.logo_without_image,
                height: AppSizes.getProportionateScreenHeight(60),
              ),
              SpaceH(inputHeigth: 25),
              Expanded(
                child: Image.network(
                  productsData.image!,
                ),
              ),
              SpaceH(inputHeigth: 25),
              CustomButton(
                text: translation(context).bookNow,
                onPress: () {
                  cubit.makeOrder(productsData.id!);
                  MagicRouter.pop();
                },
              ),
              SpaceH(inputHeigth: 10),
              CustomButton(
                text: translation(context).cancel,
                buttonColor: Colors.red,
                onPress: () {
                  MagicRouter.pop();
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
