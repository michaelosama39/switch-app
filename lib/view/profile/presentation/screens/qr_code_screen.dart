import 'package:flutter/material.dart';

import '../widgets/profile_body.dart';
import '../widgets/qr_code_body.dart';

class QrCodeScreen extends StatelessWidget {
  const QrCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QrCodeBody(),
    );
  }
}
