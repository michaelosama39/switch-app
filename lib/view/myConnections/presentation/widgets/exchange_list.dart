import 'package:flutter/material.dart';

import '../../../../widgets/connection_item.dart';
import 'bottom_sheet_exchange.dart';

class ExchangeList extends StatelessWidget {
  const ExchangeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ConnectionItem(
            onTapMore: (){
              bottomSheetExchange(context);
            },
          );
        },
      ),
    );
  }
}
