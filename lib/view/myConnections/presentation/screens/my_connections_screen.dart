import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switch_app/view/myConnections/presentation/controller/my_connections_cubit.dart';
import '../../../../core/services/services_locator.dart';
import '../widgets/my_connections_body.dart';

class MyConnectionsScreen extends StatelessWidget {
  const MyConnectionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MyConnectionsCubit(sl(), sl(), sl(), sl(), sl(), sl(), sl())
            ..getExchangeList()
            ..getConnectionList(),
      child: Scaffold(
        body: MyConnectionsBody(),
      ),
    );
  }
}
