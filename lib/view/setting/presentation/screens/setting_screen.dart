import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/view/editProfile/presentation/controller/edit_profile_cubit.dart';
import 'package:switch_app/view/profile/presentation/controller/profile_cubit.dart';
import 'package:switch_app/view/setting/presentation/controller/setting_cubit.dart';

import '../../../../core/services/services_locator.dart';
import '../../../../localization/language_constants.dart';
import '../widgets/setting_body.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SettingCubit(sl(), sl(), sl())..getMedia(),
        ),
        BlocProvider(
          create: (context) =>
              EditProfileCubit(sl(), sl(), sl(), sl())..getProfile(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          title: Text(
            translation(context).setting,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: Colors.black,
            ),
          ),
        ),
        body: SettingBody(),
      ),
    );
  }
}
