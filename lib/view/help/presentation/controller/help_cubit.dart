import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:switch_app/view/help/data/model/help_model.dart';
import 'package:switch_app/view/help/domain/usecases/get_help.dart';

import '../../../../widgets/snackBar.dart';

part 'help_state.dart';

class HelpCubit extends Cubit<HelpState> {
  HelpCubit(this.getHelpUseCase) : super(HelpInitial());

  static HelpCubit of(context) => BlocProvider.of(context);

  final GetHelp getHelpUseCase;

  List<HelpData> listOfHelpData = [];

  Future getHelp() async {
    emit(GetHelpLoading());
    final res = await getHelpUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(HelpInitial());
      },
      (res) async {
        listOfHelpData.addAll(res.data!);
        emit(HelpInitial());
      },
    );
  }
}
