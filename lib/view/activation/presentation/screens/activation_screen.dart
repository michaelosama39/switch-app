import 'package:flutter/material.dart';
import '../widgets/activation_body.dart';

class ActivationScreen extends StatelessWidget {
  const ActivationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ActivationBody(),
    );
  }
}
