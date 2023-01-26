import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/models/applications_model.dart';
import '../../../viewProfile/data/model/app_details_model.dart';
import '../widgets/show_dialogedit_link.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit of(context) => BlocProvider.of(context);

  bool isDircect = false;
  List<AppDetailsData> listOfAllApps = [];
  final accountNameController = TextEditingController();
  final accountUrlController = TextEditingController();

  editLink(BuildContext context, ProfileCubit profileCubit,
      AppDetailsData applicationsData) {
    accountNameController.text = applicationsData.account!.name!;
    accountUrlController.text = applicationsData.url!;
    showDialogEditLink(
      context,
      profileCubit,
      applicationsData,
    );
  }

  changeSelectedDircect() {
    isDircect = !isDircect;
    emit(ChangeSelectedDircectState());
  }
}
