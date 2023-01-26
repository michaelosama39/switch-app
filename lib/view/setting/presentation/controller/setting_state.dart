part of 'setting_cubit.dart';

@immutable
abstract class SettingState {}

class SettingInitial extends SettingState {}

class LogoutLoading extends SettingState {}

class DeleteAccountLoading extends SettingState {}
