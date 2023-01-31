import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:switch_app/core/models/applications_model.dart';
import 'package:switch_app/core/router/router.dart';
import 'package:switch_app/view/addLinks/domain/usecases/add_link.dart';
import 'package:switch_app/view/addLinks/domain/usecases/get_business_apps.dart';
import 'package:switch_app/view/addLinks/domain/usecases/get_creative_apps.dart';
import 'package:switch_app/view/addLinks/domain/usecases/get_music_apps.dart';
import 'package:switch_app/view/addLinks/domain/usecases/get_social_apps.dart';
import 'package:switch_app/view/bottomNav/presentation/screens/bottom_nav_screen.dart';
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
  final formKey = GlobalKey<FormState>();

  final searchController = TextEditingController();

  List<ApplicationsData> searchResultSocialApps = [];
  List<ApplicationsData> searchResultMusicApps = [];
  List<ApplicationsData> searchResultBusinessApps = [];
  List<ApplicationsData> searchResultCreativeApps = [];

  searchTextChanged(String text) async {
    searchResultSocialApps.clear();
    searchResultMusicApps.clear();
    searchResultBusinessApps.clear();
    searchResultCreativeApps.clear();

    // SocialApps
    listOfSocialApps.forEach((userDetail) {
      if (userDetail.name!.contains(text) ||
          userDetail.name!.contains(text[0].toUpperCase()))
        searchResultSocialApps.add(userDetail);
    });
    listOfSocialApps.clear();
    if (text.isEmpty) {
      getSocialApps();
      listOfSocialApps.addAll(listOfSocialApps);
    } else {
      listOfSocialApps.addAll(searchResultSocialApps);
    }

    // MusicApps
    listOfMusicApps.forEach((userDetail) {
      if (userDetail.name!.contains(text) ||
          userDetail.name!.contains(text[0].toUpperCase()))
        searchResultMusicApps.add(userDetail);
    });
    listOfMusicApps.clear();
    if (text.isEmpty) {
      getMusicApps();
      listOfMusicApps.addAll(listOfMusicApps);
    } else {
      listOfMusicApps.addAll(searchResultMusicApps);
    }

    // BusinessApps
    listOfBusinessApps.forEach((userDetail) {
      if (userDetail.name!.contains(text) ||
          userDetail.name!.contains(text[0].toUpperCase()))
        searchResultBusinessApps.add(userDetail);
    });
    listOfBusinessApps.clear();
    if (text.isEmpty) {
      getBusinessApps();
      listOfBusinessApps.addAll(listOfBusinessApps);
    } else {
      listOfBusinessApps.addAll(searchResultBusinessApps);
    }

    // CreativeApps
    listOfCreativeApps.forEach((userDetail) {
      if (userDetail.name!.contains(text) ||
          userDetail.name!.contains(text[0].toUpperCase()))
        searchResultCreativeApps.add(userDetail);
    });
    listOfCreativeApps.clear();
    if (text.isEmpty) {
      getCreativeApps();
      listOfCreativeApps.addAll(listOfCreativeApps);
    } else {
      listOfCreativeApps.addAll(searchResultCreativeApps);
    }

    emit(SearchStateLoaded());
  }

  Future getSocialApps() async {
    emit(GetAppsStateLoading());
    final res = await getSocialAppsUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(AddLinksInitial());
      },
      (res) async {
        listOfSocialApps.addAll(res.item!);
        emit(AddLinksInitial());
      },
    );
  }

  Future getMusicApps() async {
    emit(GetAppsStateLoading());
    final res = await getMusicAppsUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(AddLinksInitial());
      },
      (res) async {
        listOfMusicApps.addAll(res.item!);
        emit(AddLinksInitial());
      },
    );
  }

  Future getBusinessApps() async {
    emit(GetAppsStateLoading());
    final res = await getBusinessAppsUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(AddLinksInitial());
      },
      (res) async {
        listOfBusinessApps.addAll(res.item!);
        emit(AddLinksInitial());
      },
    );
  }

  Future getCreativeApps() async {
    emit(GetAppsStateLoading());
    final res = await getCreativeAppsUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(AddLinksInitial());
      },
      (res) async {
        listOfCreativeApps.addAll(res.item!);
        emit(AddLinksInitial());
      },
    );
  }

  Future addLink() async {
    emit(AddLinkLoading());
    final res = await addLinkUseCase.execute(
        pageTitleController.text, urlController.text, categoryName!, typeId!);
    res.fold(
      (err) {
        showSnackBar(err.message);
        pageTitleController.clear();
        urlController.clear();
        MagicRouter.pop();
        emit(AddLinksInitial());
      },
      (res) async {
        pageTitleController.clear();
        urlController.clear();
        MagicRouter.navigateAndPopAll(BottomNavScreen());
        emit(AddLinksInitial());
      },
    );
  }
}
