import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switch_app/view/myConnections/data/model/connection_model.dart';
import 'package:switch_app/view/myConnections/presentation/controller/my_connections_cubit.dart';

import '../../../../core/utils/app_sizes.dart';
import '../../../../localization/language_constants.dart';
import '../../../../widgets/connection_item.dart';
import 'bottom_sheet_connection.dart';
import 'bottom_sheet_remove_favourite.dart';

class FavouriteBody extends StatelessWidget {
  const FavouriteBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyConnectionsCubit, MyConnectionsState>(
      buildWhen: (previous, current) =>
          previous != current && current is MyConnectionsInitial ||
          current is GetFavouriteListLoaded,
      builder: (context, state) {
        final myConnectionsCubit = MyConnectionsCubit.of(context);
        return Container(
          padding: EdgeInsets.only(
            top: AppSizes.getProportionateScreenHeight(10),
            left: AppSizes.getProportionateScreenWidth(10),
            right: AppSizes.getProportionateScreenWidth(10),
          ),
          child: myConnectionsCubit.listOfFavouriteData.isEmpty
              ? Container(
                  height: AppSizes.screenHeight,
                  width: AppSizes.screenWidth,
                  alignment: Alignment.center,
                  child: Text(translation(context).noData),
                )
              : ListView.builder(
                  itemCount: myConnectionsCubit.listOfFavouriteData.length,
                  itemBuilder: (context, index) {
                    return ConnectionItem(
                      getData: myConnectionsCubit.listOfFavouriteData[index],
                      onTapMore: () {
                        bottomSheetRemoveFavourite(
                          context,
                          myConnectionsCubit,
                          myConnectionsCubit.listOfFavouriteData[index],
                        );
                      },
                    );
                  },
                ),
        );
      },
    );
  }
}
