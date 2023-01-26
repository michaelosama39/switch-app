part of 'edit_profile_cubit.dart';

@immutable
abstract class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class GetProfileLoading extends EditProfileState {}
class SelectImageState extends EditProfileState {}
class EditProfileDataLoading extends EditProfileState {}

