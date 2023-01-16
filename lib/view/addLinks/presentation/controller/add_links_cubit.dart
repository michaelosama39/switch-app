import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:switch_app/core/models/applications_model.dart';
import 'package:switch_app/core/models/msg_model.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/view/addLinks/domain/usecases/add_link.dart';
import 'package:switch_app/view/addLinks/domain/usecases/get_business_apps.dart';
import 'package:switch_app/view/addLinks/domain/usecases/get_creative_apps.dart';
import 'package:switch_app/view/addLinks/domain/usecases/get_music_apps.dart';
import 'package:switch_app/view/addLinks/domain/usecases/get_social_apps.dart';

import '../../../../core/utils/app_enums.dart';
import '../../../../widgets/snackBar.dart';

part 'add_links_state.dart';

class AddLinksCubit extends Cubit<AddLinksState> {
  AddLinksCubit(
      this.getSocialAppsUseCase,
      this.getMusicAppsUseCase,
      this.getBusinessAppsUseCase,
      this.getCreativeAppsUseCase,
      this.addLinkUseCase)
      : super(AddLinksInitial());

  static AddLinksCubit of(context) => BlocProvider.of(context);

  final GetSocialApps getSocialAppsUseCase;
  final GetMusicApps getMusicAppsUseCase;
  final GetBusinessApps getBusinessAppsUseCase;
  final GetCreativeApps getCreativeAppsUseCase;
  final AddLink addLinkUseCase;

  List<ApplicationsData> listOfSocialApps = [];
  List<ApplicationsData> listOfMusicApps = [];
  List<ApplicationsData> listOfBusinessApps = [];
  List<ApplicationsData> listOfCreativeApps = [];

  final pageTitleController = TextEditingController();
  final urlController = TextEditingController();

  String? categoryName;
  int? typeId;

  Future getSocialApps() async {
    emit(GetSocialAppsState(
      applicationsState: RequestState.loading,
    ));
    final res = await getSocialAppsUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetSocialAppsState(
          message: err.message,
          applicationsState: RequestState.error,
        ));
      },
      (res) async {
        listOfSocialApps.addAll(res.item!);
        emit(GetSocialAppsState(
          applicationsModel: res,
          applicationsState: RequestState.loaded,
        ));
      },
    );
  }

  Future getMusicApps() async {
    emit(GetMusicAppsState(
      applicationsState: RequestState.loading,
    ));
    final res = await getMusicAppsUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetMusicAppsState(
          message: err.message,
          applicationsState: RequestState.error,
        ));
      },
      (res) async {
        listOfMusicApps.addAll(res.item!);
        emit(GetMusicAppsState(
          applicationsModel: res,
          applicationsState: RequestState.loaded,
        ));
      },
    );
  }

  Future getBusinessApps() async {
    emit(GetBusinessAppsState(
      applicationsState: RequestState.loading,
    ));
    final res = await getBusinessAppsUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetBusinessAppsState(
          message: err.message,
          applicationsState: RequestState.error,
        ));
      },
      (res) async {
        listOfBusinessApps.addAll(res.item!);
        emit(GetBusinessAppsState(
          applicationsModel: res,
          applicationsState: RequestState.loaded,
        ));
      },
    );
  }

  Future getCreativeApps() async {
    emit(GetCreativeAppsState(
      applicationsState: RequestState.loading,
    ));
    final res = await getCreativeAppsUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetCreativeAppsState(
          message: err.message,
          applicationsState: RequestState.error,
        ));
      },
      (res) async {
        listOfCreativeApps.addAll(res.item!);
        emit(GetCreativeAppsState(
          applicationsModel: res,
          applicationsState: RequestState.loaded,
        ));
      },
    );
  }

  Future addLink() async {
    emit(AddLinkState(
      msgState: RequestState.loading,
    ));
    final res =
        await addLinkUseCase.execute(pageTitleController.text, urlController.text, categoryName!, typeId!);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(AddLinkState(
          message: err.message,
          msgState: RequestState.error,
        ));
      },
      (res) async {
        emit(AddLinkState(
          msgModel: res,
          msgState: RequestState.loaded,
        ));
        pageTitleController.clear();
        urlController.clear();
        MagicRouter.pop();
      },
    );
  }
}
