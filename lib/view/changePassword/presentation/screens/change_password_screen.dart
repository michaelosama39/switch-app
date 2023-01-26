import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switch_app/view/changePassword/presentation/controller/change_password_cubit.dart';
import 'package:switch_app/view/changePassword/presentation/widgets/change_password_appbar.dart';
import '../../../../core/services/services_locator.dart';
import '../widgets/change_password_body.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(sl()),
      child: Scaffold(
        appBar: ChangePasswordAppBar(),
        body: ChangePasswordBody(),
      ),
    );
  }
}
