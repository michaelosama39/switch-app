import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switch_app/core/services/services_locator.dart';
import 'package:switch_app/view/editProfile/presentation/controller/edit_profile_cubit.dart';

import '../widgets/edit_profile_appbar.dart';
import '../widgets/edit_profile_body.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileCubit(sl(), sl())..getProfile(),
      child: Scaffold(
        appBar: EditProfileAppBar(),
        body: EditProfileBody(),
      ),
    );
  }
}
