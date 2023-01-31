import 'package:flutter/material.dart';
import '../widgets/reset_password_body.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResetPasswordBody(),
    );
  }
}
