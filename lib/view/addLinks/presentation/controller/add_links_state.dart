part of 'add_links_cubit.dart';

@immutable
abstract class AddLinksState {}

class AddLinksInitial extends AddLinksState {}

class GetSocialAppsState extends AddLinksState {
  final ApplicationsModel? applicationsModel;
  final RequestState applicationsState;
  final String message;

  GetSocialAppsState({
    this.applicationsModel,
    this.applicationsState = RequestState.initial,
    this.message = '',
  });
}

class GetMusicAppsState extends AddLinksState {
  final ApplicationsModel? applicationsModel;
  final RequestState applicationsState;
  final String message;

  GetMusicAppsState({
    this.applicationsModel,
    this.applicationsState = RequestState.initial,
    this.message = '',
  });
}

class GetBusinessAppsState extends AddLinksState {
  final ApplicationsModel? applicationsModel;
  final RequestState applicationsState;
  final String message;

  GetBusinessAppsState({
    this.applicationsModel,
    this.applicationsState = RequestState.initial,
    this.message = '',
  });
}

class GetCreativeAppsState extends AddLinksState {
  final ApplicationsModel? applicationsModel;
  final RequestState applicationsState;
  final String message;

  GetCreativeAppsState({
    this.applicationsModel,
    this.applicationsState = RequestState.initial,
    this.message = '',
  });
}

class GetAllAppsState extends AddLinksState {
  final List<ApplicationsData>? applicationsModel;
  final RequestState applicationsState;
  final String message;

  GetAllAppsState({
    this.applicationsModel,
    this.applicationsState = RequestState.initial,
    this.message = '',
  });
}

class AddLinkState extends AddLinksState {
  final MsgModel? msgModel;
  final RequestState msgState;
  final String message;

  AddLinkState({
    this.msgModel,
    this.msgState = RequestState.initial,
    this.message = '',
  });
}