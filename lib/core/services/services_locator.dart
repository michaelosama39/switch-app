import 'package:get_it/get_it.dart';
import 'package:switch_app/view/login/presentation/controller/login_cubit.dart';

import '../../view/login/data/datasource/login_remote_datasource.dart';
import '../../view/login/data/repository/login_repository.dart';
import '../../view/login/domain/repository/base_login_repository.dart';
import '../../view/login/domain/usecases/login.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    sl.registerFactory(() => LoginCubit(sl()));
    sl.registerLazySingleton(() => Login(sl()));

    sl.registerLazySingleton<BaseLoginRepository>(() => LoginRepository(sl()));

    sl.registerLazySingleton<BaseLoginRemoteDatasource>(
        () => LoginRemoteDatasource());
  }
}
