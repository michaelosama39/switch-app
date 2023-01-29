import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switch_app/view/viewProfile/presentation/controller/view_profile_cubit.dart';
import '../../../../core/services/services_locator.dart';
import '../../../editProfile/presentation/controller/edit_profile_cubit.dart';
import '../widgets/view_profile_appbar.dart';
import '../widgets/view_profile_body.dart';

class ViewProfileScreen extends StatelessWidget {
  const ViewProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ViewProfileCubit(sl(), sl() , sl())..showAppDetails(),
        ),
        BlocProvider(
          create: (context) =>
              EditProfileCubit(sl(), sl(), sl(), sl())..getProfile(),
        ),
      ],
      child: Scaffold(
        appBar: ViewProfileAppBar(),
        body: ViewProfileBody(),
      ),
    );
  }
}
