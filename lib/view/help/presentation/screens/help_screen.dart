import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switch_app/view/help/presentation/controller/help_cubit.dart';
import '../../../../core/services/services_locator.dart';
import '../widgets/help_appbar.dart';
import '../widgets/help_body.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HelpCubit(sl())..getHelp(),
      child: Scaffold(
        appBar: HelpAppBar(),
        body: const HelpBody(),
      ),
    );
  }
}
