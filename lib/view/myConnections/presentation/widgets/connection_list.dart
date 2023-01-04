import 'package:flutter/material.dart';

import '../../../../widgets/connection_item.dart';
import 'bottom_sheet_connection.dart';

class ConnectionList extends StatelessWidget {
  const ConnectionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ConnectionItem(
            onTapMore: (){
              bottomSheetConnection(context);
            },
          );
        },
      ),
    );
  }
}
