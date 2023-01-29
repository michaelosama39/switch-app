import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/services_locator.dart';
import '../controller/my_connections_cubit.dart';
import '../widgets/add_connection_appbar.dart';
import '../widgets/add_connection_body.dart';

class AddConnectionScreen extends StatelessWidget {
  const AddConnectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MyConnectionsCubit(sl(), sl(), sl(), sl(), sl(), sl() , sl()),
      child: Scaffold(
        appBar: AddConnectionAppBar(),
        body: AddConnectionBody(),
      ),
    );
  }
}
