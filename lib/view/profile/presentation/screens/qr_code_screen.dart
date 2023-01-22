import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switch_app/view/editProfile/presentation/controller/edit_profile_cubit.dart';
import '../../../../core/services/services_locator.dart';
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
