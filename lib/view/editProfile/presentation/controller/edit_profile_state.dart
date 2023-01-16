part of 'edit_profile_cubit.dart';

@immutable
abstract class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class GetProfileState extends EditProfileState {
  final ProfileModel? userData;
  final RequestState userState;
  final String message;

  GetProfileState({
    this.userData,
    this.userState = RequestState.initial,
    this.message = '',
  });
}

class EditProfileDataState extends EditProfileState {
  final MsgModel? userData;
  final RequestState userState;
  final String message;

  EditProfileDataState({
    this.userData,
    this.userState = RequestState.initial,
    this.message = '',
  });
}
