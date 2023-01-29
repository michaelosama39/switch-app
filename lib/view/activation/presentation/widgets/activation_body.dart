import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switch_app/view/activation/presentation/widgets/activation_product_item.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../store/presentation/controller/store_cubit.dart';

class ActivationBody extends StatelessWidget {
  const ActivationBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        // top: AppSizes.getProportionateScreenHeight(30),
        left: AppSizes.getProportionateScreenWidth(10),
        right: AppSizes.getProportionateScreenWidth(10),
      ),
      child: Column(
        children: [
          BlocBuilder<StoreCubit, StoreState>(
            builder: (context, state) {
              final cubit = StoreCubit.of(context);
              return Expanded(
                      child: ListView.builder(
                              itemCount: cubit.listOfProductsData.length,
                              itemBuilder: (context, index) {
                                return ActivationProductItem(
                                  productsData: cubit.listOfProductsData[index],
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
