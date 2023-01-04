import 'package:flutter/material.dart';
import 'package:switch_app/view/changePassword/presentation/widgets/change_password_appbar.dart';
import '../widgets/change_password_body.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChangePasswordAppBar(),
      body: ChangePasswordBody(),
    );
  }
}
