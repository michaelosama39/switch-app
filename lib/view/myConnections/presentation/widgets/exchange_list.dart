import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_sizes.dart';
import '../../../../localization/language_constants.dart';
import '../../../../widgets/connection_item.dart';
import '../controller/my_connections_cubit.dart';
import 'bottom_sheet_exchange.dart';

class ExchangeList extends StatelessWidget {
  const ExchangeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<MyConnectionsCubit, MyConnectionsState>(
        buildWhen: (previous, current) =>
            previous != current && current is MyConnectionsInitial ||
            current is GetExchangeListLoaded,
        builder: (context, state) {
          final myConnectionsCubit = MyConnectionsCubit.of(context);
          return myConnectionsCubit.listOfExchangeData.isEmpty
              ? Container(
                  height: AppSizes.screenHeight,
                  width: AppSizes.screenWidth,
                  alignment: Alignment.center,
                  child: Text(translation(context).noData),
                )
              : ListView.builder(
                  itemCount: myConnectionsCubit.listOfExchangeData.length,
                  itemBuilder: (context, index) {
                    return ConnectionItem(
                      getData: myConnectionsCubit.listOfExchangeData[index],
                      onTapMore: () {
                        bottomSheetExchange(
                          context,
                          myConnectionsCubit,
                          myConnectionsCubit.listOfExchangeData[index],
                        );
                      },
                    );
                  },
                );
        },
      ),
    );
  }
}
