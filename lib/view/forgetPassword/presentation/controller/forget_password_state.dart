part of 'forget_password_cubit.dart';

@immutable
abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}
class ForgetPasswordLoading extends ForgetPasswordState {}
class VerficationCodeLoading extends ForgetPasswordState {}
