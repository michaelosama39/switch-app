import 'package:flutter/material.dart';
import '../widgets/help_appbar.dart';
import '../widgets/help_body.dart';


class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HelpAppBar(),
      body: const HelpBody(),
    );
  }
}