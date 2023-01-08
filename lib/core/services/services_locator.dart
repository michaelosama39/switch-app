import 'package:get_it/get_it.dart';
import 'package:switch_app/view/login/presentation/controller/login_cubit.dart';
import 'package:switch_app/view/register/data/datasource/register_remote_datasource.dart';
import 'package:switch_app/view/register/presentation/controller/register_cubit.dart';
import '../../view/login/data/datasource/login_remote_datasource.dart';
import '../../view/login/data/repository/login_repository.dart';
import '../../view/login/domain/repository/base_login_repository.dart';
import '../../view/login/domain/usecases/login.dart';
import '../../view/register/data/repository/register_repository.dart';
import '../../view/register/domain/repository/base_register_repository.dart';
import '../../view/register/domain/usecases/register.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {

    // register
    sl.registerFactory(() => RegisterCubit(sl()));
    sl.registerLazySingleton(() => Register(sl()));

    sl.registerLazySingleton<BaseRegisterRepository>(() => RegisterRepository(sl()));

    sl.registerLazySingleton<BaseRegisterRemoteDatasource>(
            () => RegisterRemoteDatasource());

    // login
    sl.registerFactory(() => LoginCubit(sl()));
    sl.registerLazySingleton(() => Login(sl()));

    sl.registerLazySingleton<BaseLoginRepository>(() => LoginRepository(sl()));

    sl.registerLazySingleton<BaseLoginRemoteDatasource>(
        () => LoginRemoteDatasource());
  }
}
