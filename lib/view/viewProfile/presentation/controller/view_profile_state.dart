part of 'view_profile_cubit.dart';

@immutable
abstract class ViewProfileState {}

class ViewProfileInitial extends ViewProfileState {}
class ViewProfileLoaded extends ViewProfileState {}
class ShowAppDetailsSocialLoading extends ViewProfileState {}
class ShowAppDetailsCreativeLoading extends ViewProfileState {}
class ShowAppDetailsMusicLoading extends ViewProfileState {}
class ShowAppDetailsBusinessLoading extends ViewProfileState {}
