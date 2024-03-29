import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/view/store/presentation/controller/store_cubit.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../localization/language_constants.dart';
import '../controller/activation_cubit.dart';
import '../widgets/activation_body.dart';

class ActivationScreen extends StatelessWidget {
  const ActivationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreCubit(sl(), sl())..getAllProducts(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          title: Text(
            translation(context).chooseSwitchProductToActivate,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: Colors.black,
            ),
          ),
        ),
        body: ActivationBody(),
      ),
    );
  }
}
