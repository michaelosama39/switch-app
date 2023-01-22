import 'package:get_it/get_it.dart';
import 'package:switch_app/view/activation/domain/usecases/activation_product.dart';
import 'package:switch_app/view/activation/domain/usecases/get_orders.dart';
import 'package:switch_app/view/activation/presentation/controller/activation_cubit.dart';
import 'package:switch_app/view/addLinks/data/datasource/add_links_remote_datasource.dart';
import 'package:switch_app/view/addLinks/data/repository/add_links_repository.dart';
import 'package:switch_app/view/addLinks/domain/repository/base_add_links_repository.dart';
import 'package:switch_app/view/addLinks/domain/usecases/add_link.dart';
import 'package:switch_app/view/addLinks/domain/usecases/get_business_apps.dart';
import 'package:switch_app/view/addLinks/domain/usecases/get_creative_apps.dart';
import 'package:switch_app/view/addLinks/domain/usecases/get_music_apps.dart';
import 'package:switch_app/view/addLinks/presentation/controller/add_links_cubit.dart';
import 'package:switch_app/view/editProfile/data/datasource/edit_profile_remote_datasource.dart';
import 'package:switch_app/view/editProfile/domain/usecases/edit_profile.dart';
import 'package:switch_app/view/editProfile/domain/usecases/get_profile.dart';
import 'package:switch_app/view/login/presentation/controller/login_cubit.dart';
import 'package:switch_app/view/register/data/datasource/register_remote_datasource.dart';
import 'package:switch_app/view/register/presentation/controller/register_cubit.dart';
import 'package:switch_app/view/setting/domain/usecases/logout.dart';
import 'package:switch_app/view/setting/presentation/controller/setting_cubit.dart';
import 'package:switch_app/view/store/data/datasource/store_remote_datasource.dart';
import 'package:switch_app/view/store/data/repository/store_repository.dart';
import 'package:switch_app/view/store/domain/repository/base_store_repository.dart';
import 'package:switch_app/view/store/domain/usecases/get_all_products.dart';
import 'package:switch_app/view/store/domain/usecases/make_order.dart';
import 'package:switch_app/view/store/presentation/controller/store_cubit.dart';
import '../../view/activation/data/datasource/activation_remote_datasource.dart';
import '../../view/activation/data/repository/activation_repository.dart';
import '../../view/activation/domain/repository/base_activation_repository.dart';
import '../../view/addLinks/domain/usecases/get_social_apps.dart';
import '../../view/editProfile/data/repository/edit_profile_repository.dart';
import '../../view/editProfile/domain/repository/base_edit_profile_repository.dart';
import '../../view/editProfile/presentation/controller/edit_profile_cubit.dart';
import '../../view/login/data/datasource/login_remote_datasource.dart';
import '../../view/login/data/repository/login_repository.dart';
import '../../view/login/domain/repository/base_login_repository.dart';
import '../../view/login/domain/usecases/login.dart';
import '../../view/register/data/repository/register_repository.dart';
import '../../view/register/domain/repository/base_register_repository.dart';
import '../../view/register/domain/usecases/register.dart';
import '../../view/setting/data/datasource/setting_remote_datasource.dart';
import '../../view/setting/data/repository/setting_repository.dart';
import '../../view/setting/domain/repository/base_setting_repository.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {

    // activation
    sl.registerLazySingleton(() => GetOrders(sl()));
    sl.registerLazySingleton(() => ActivationProduct(sl()));
    sl.registerFactory(() => ActivationCubit(sl() , sl()));

    sl.registerLazySingleton<BaseActivationRepository>(() => ActivationRepository(sl()));

    sl.registerLazySingleton<BaseActivationRemoteDatasource>(
            () => ActivationRemoteDatasource());

    // editProfile
    sl.registerLazySingleton(() => EditProfile(sl()));
    sl.registerLazySingleton(() => GetProfile(sl()));
    sl.registerFactory(() => EditProfileCubit(sl(), sl()));

    sl.registerLazySingleton<BaseEditProfileRepository>(
        () => EditProfileRepository(sl()));

    sl.registerLazySingleton<BaseEditProfileRemoteDatasource>(
        () => EditProfileRemoteDatasource());

    // addLinks
    sl.registerLazySingleton(() => AddLink(sl()));
    sl.registerLazySingleton(() => GetSocialApps(sl()));
    sl.registerLazySingleton(() => GetMusicApps(sl()));
    sl.registerLazySingleton(() => GetCreativeApps(sl()));
    sl.registerLazySingleton(() => GetBusinessApps(sl()));
    sl.registerFactory(() => AddLinksCubit(sl(), sl(), sl(), sl(), sl()));

    sl.registerLazySingleton<BaseAddLinksRepository>(
        () => AddLinksRepository(sl()));

    sl.registerLazySingleton<BaseAddLinksRemoteDatasource>(
        () => AddLinksRemoteDatasource());

    // setting
    sl.registerLazySingleton(() => Logout(sl()));
    sl.registerFactory(() => SettingCubit(sl()));

    sl.registerLazySingleton<BaseSettingRepository>(
        () => SettingRepository(sl()));

    sl.registerLazySingleton<BaseSettingRemoteDatasource>(
        () => SettingRemoteDatasource());

    // store
    sl.registerLazySingleton(() => MakeOrder(sl()));
    sl.registerLazySingleton(() => GetAllProducts(sl()));
    sl.registerFactory(() => StoreCubit(sl(), sl()));

    sl.registerLazySingleton<BaseStoreRepository>(() => StoreRepository(sl()));

    sl.registerLazySingleton<BaseStoreRemoteDatasource>(
        () => StoreRemoteDatasource());

    // register
    sl.registerLazySingleton(() => Register(sl()));
    sl.registerFactory(() => RegisterCubit(sl()));

    sl.registerLazySingleton<BaseRegisterRepository>(
        () => RegisterRepository(sl()));

    sl.registerLazySingleton<BaseRegisterRemoteDatasource>(
        () => RegisterRemoteDatasource());

    // login
    sl.registerLazySingleton(() => Login(sl()));
    sl.registerFactory(() => LoginCubit(sl()));

    sl.registerLazySingleton<BaseLoginRepository>(() => LoginRepository(sl()));

    sl.registerLazySingleton<BaseLoginRemoteDatasource>(
        () => LoginRemoteDatasource());
  }
}
