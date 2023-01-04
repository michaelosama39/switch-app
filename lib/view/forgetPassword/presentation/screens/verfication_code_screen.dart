import 'package:flutter/material.dart';
import '../widgets/verfication_code_body.dart';

class VerficationCodeScreen extends StatelessWidget {
  const VerficationCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VerficationCodeBody(),
    );
  }
}
