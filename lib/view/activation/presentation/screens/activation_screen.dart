import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switch_app/view/activation/presentation/controller/activation_cubit.dart';
import '../../../../core/services/services_locator.dart';
import '../widgets/activation_body.dart';

class ActivationScreen extends StatelessWidget {
  const ActivationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActivationCubit(sl())..getOrders(),
      child: Scaffold(
        body: ActivationBody(),
      ),
    );
  }
}
