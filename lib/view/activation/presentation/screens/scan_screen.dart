import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/services_locator.dart';
import '../../../editProfile/presentation/controller/edit_profile_cubit.dart';
import '../controller/activation_cubit.dart';
import '../widgets/scan_appbar.dart';
import '../widgets/scan_body.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ActivationCubit(sl(), sl()),
        ),
        BlocProvider(
          create: (context) => EditProfileCubit(sl(), sl())..getProfile(),
        ),
      ],
      child: Scaffold(
        appBar: ScanAppBar(),
        body: ScanBody(),
      ),
    );
  }
}
