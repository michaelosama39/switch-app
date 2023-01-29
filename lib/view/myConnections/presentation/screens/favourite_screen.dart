import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/services_locator.dart';
import '../controller/my_connections_cubit.dart';
import '../widgets/favourite_appbar.dart';
import '../widgets/favourite_body.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MyConnectionsCubit(sl(), sl(), sl(), sl(), sl(), sl(), sl())
            ..getFavouriteList(),
      child: Scaffold(
        appBar: FavouriteAppBar(),
        body: FavouriteBody(),
      ),
    );
  }
}
