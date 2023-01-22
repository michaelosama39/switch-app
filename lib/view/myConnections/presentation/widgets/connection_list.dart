import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/connection_item.dart';
import '../controller/my_connections_cubit.dart';
import 'bottom_sheet_connection.dart';

class ConnectionList extends StatelessWidget {
  const ConnectionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<MyConnectionsCubit, MyConnectionsState>(
        buildWhen: (previous, current) =>
            previous != current && current is MyConnectionsInitial ||
            current is GetConnectionListLoaded,
        builder: (context, state) {
          final myConnectionsCubit = MyConnectionsCubit.of(context);
          return ListView.builder(
            itemCount: myConnectionsCubit.listOfConnectionData.length,
            itemBuilder: (context, index) {
              return ConnectionItem(
                getData: myConnectionsCubit.listOfConnectionData[index],
                onTapMore: () {
                  bottomSheetConnection(context , myConnectionsCubit,
                    myConnectionsCubit.listOfConnectionData[index],);
                },
              );
            },
          );
        },
      ),
    );
  }
}
