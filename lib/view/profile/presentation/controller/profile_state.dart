part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ChangeSelectedDircectState extends ProfileState {}

class ShowAppDetailsLoaded extends ProfileState {}

class ShowAppDetailsLoading extends ProfileState {}

class EditAppDetailsLoading extends ProfileState {}

class DeleteAppStateLoaded extends ProfileState {}

class RepositionAppsLoaded extends ProfileState {}
