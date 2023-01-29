import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switch_app/view/help/presentation/controller/help_cubit.dart';
import 'package:switch_app/widgets/loading_indicator.dart';
import 'help_card.dart';

class HelpBody extends StatelessWidget {
  const HelpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HelpCubit, HelpState>(
      builder: (context, state) {
        final cubit = HelpCubit.of(context);
        return state is GetHelpLoading
            ? LoadingIndicator()
            : ListView.builder(
                itemCount: cubit.listOfHelpData.length,
                itemBuilder: (context, index) {
                  return HelpCard(
                    title: cubit.listOfHelpData[index].question!,
                    desc: cubit.listOfHelpData[index].answer!,
                  );
                },
              );
      },
    );
  }
}
