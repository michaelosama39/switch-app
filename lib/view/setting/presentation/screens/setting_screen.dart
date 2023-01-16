import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switch_app/view/setting/presentation/controller/setting_cubit.dart';

import '../../../../core/services/services_locator.dart';
import '../widgets/setting_body.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingCubit(sl()),
      child: Scaffold(
        body: SettingBody(),
      ),
    );
  }
}
