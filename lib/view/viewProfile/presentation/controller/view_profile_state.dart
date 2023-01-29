part of 'view_profile_cubit.dart';

@immutable
abstract class ViewProfileState {}

class ViewProfileInitial extends ViewProfileState {}

class ShowAppDetailsLoaded extends ViewProfileState {}

class ShowAppDetailsLoading extends ViewProfileState {}

class EditAppDetailsLoading extends ViewProfileState {}