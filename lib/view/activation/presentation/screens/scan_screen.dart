import 'package:flutter/material.dart';
import '../widgets/activation_body.dart';
import '../widgets/scan_appbar.dart';
import '../widgets/scan_body.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScanAppBar(),
      body: ScanBody(),
    );
  }
}
