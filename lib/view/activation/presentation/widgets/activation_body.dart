import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/core/utils/app_assets.dart';
import 'package:switch_app/core/utils/app_enums.dart';
import 'package:switch_app/localization/language_constants.dart';
import 'package:switch_app/view/activation/presentation/controller/activation_cubit.dart';
import 'package:switch_app/view/activation/presentation/widgets/activation_product_item.dart';
import 'package:switch_app/widgets/loading_indicator.dart';

import '../../../../core/utils/app_sizes.dart';

class ActivationBody extends StatelessWidget {
  const ActivationBody({Key? key}) : super(key: key);

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
              translation(context).chooseSwitchProductToActivate,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
                color: Colors.black,
              ),
            ),
          ),
          BlocBuilder<ActivationCubit, ActivationState>(
            builder: (context, state) {
              final cubit = ActivationCubit.of(context);
              return state.ordersState == RequestState.loading
                  ? Expanded(
                      child: LoadingIndicator(),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: cubit.listOfOrders.length,
                        itemBuilder: (context, index) {
                          return ActivationProductItem(
                            ordersData: cubit.listOfOrders[index],
                          );
                        },
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
