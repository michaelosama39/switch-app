import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switch_app/view/addLinks/presentation/controller/add_links_cubit.dart';
import 'package:switch_app/view/viewProfile/presentation/controller/view_profile_cubit.dart';
import '../../../../core/services/services_locator.dart';
import '../widgets/add_links_appbar.dart';
import '../widgets/add_links_body.dart';

class AddLinksScreen extends StatelessWidget {
  const AddLinksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddLinksCubit(sl(), sl(), sl(), sl(), sl())
            ..getSocialApps()
            ..getBusinessApps()
            ..getCreativeApps()
            ..getMusicApps(),
        ),
        BlocProvider(
          create: (context) => ViewProfileCubit(sl() , sl(), sl()),
        ),
      ],
      child: Scaffold(
        appBar: AddLinksAppBar(),
        body: AddLinksBody(),
      ),
    );
  }
}
