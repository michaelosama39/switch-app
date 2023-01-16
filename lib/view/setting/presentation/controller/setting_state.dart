part of 'setting_cubit.dart';

@immutable
abstract class SettingState {}

class SettingInitial extends SettingState {}

class LogoutState extends SettingState {
  final MsgModel? msgModel;
  final RequestState logoutState;
  final String message;

  LogoutState({
    this.msgModel,
    this.logoutState = RequestState.initial,
    this.message = '',
  });
}
