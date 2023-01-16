import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit of(context) => BlocProvider.of(context);

  bool isDircect = false;

  changeSelectedDircect(){
    isDircect = !isDircect;
    emit(ChangeSelectedDircectState());
  }
}
