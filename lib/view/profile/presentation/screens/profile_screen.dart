import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switch_app/view/addLinks/presentation/controller/add_links_cubit.dart';
import 'package:switch_app/view/editProfile/presentation/controller/edit_profile_cubit.dart';

import '../../../../core/services/services_locator.dart';
import '../controller/profile_cubit.dart';
import '../widgets/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileCubit(),
        ),
        BlocProvider(
          create: (context) => AddLinksCubit(sl(), sl(), sl(), sl(), sl())
            ..getSocialApps()
            ..getMusicApps()
            ..getCreativeApps()
            ..getBusinessApps()
        ),
        BlocProvider(
          create: (context) => EditProfileCubit(sl(), sl())..getProfile(),
        ),
      ],
      child: Scaffold(
        body: ProfileBody(),
      ),
    );
  }
}
