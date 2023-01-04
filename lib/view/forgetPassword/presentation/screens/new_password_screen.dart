import 'package:flutter/material.dart';
import '../widgets/forget_password_body.dart';
import '../widgets/new_password_body.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NewPasswordBody(),
    );
  }
}
