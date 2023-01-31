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
import 'package:switch_app/view/changePassword/domain/usecases/change_password.dart';
import 'package:switch_app/view/editProfile/data/datasource/edit_profile_remote_datasource.dart';
import 'package:switch_app/view/editProfile/domain/usecases/edit_background_image.dart';
import 'package:switch_app/view/editProfile/domain/usecases/edit_image.dart';
import 'package:switch_app/view/editProfile/domain/usecases/edit_profile.dart';
import 'package:switch_app/view/editProfile/domain/usecases/get_profile.dart';
import 'package:switch_app/view/forgetPassword/domain/usecases/reset_password.dart';
import 'package:switch_app/view/forgetPassword/domain/usecases/verfication_code.dart';
import 'package:switch_app/view/help/domain/usecases/get_help.dart';
import 'package:switch_app/view/login/presentation/controller/login_cubit.dart';
import 'package:switch_app/view/myConnections/domain/usecases/add_new_connection.dart';
import 'package:switch_app/view/myConnections/domain/usecases/delete_connection.dart';
import 'package:switch_app/view/myConnections/domain/usecases/exchange_status.dart';
import 'package:switch_app/view/myConnections/domain/usecases/favourite_status.dart';
import 'package:switch_app/view/myConnections/domain/usecases/get_connection_list.dart';
import 'package:switch_app/view/myConnections/domain/usecases/get_exchange_list.dart';
import 'package:switch_app/view/myConnections/domain/usecases/get_favourite_list.dart';
import 'package:switch_app/view/profile/domain/usecases/delete_app.dart';
import 'package:switch_app/view/register/data/datasource/register_remote_datasource.dart';
import 'package:switch_app/view/register/presentation/controller/register_cubit.dart';
import 'package:switch_app/view/setting/domain/usecases/delete_account.dart';
import 'package:switch_app/view/setting/domain/usecases/get_media.dart';
import 'package:switch_app/view/setting/domain/usecases/logout.dart';
import 'package:switch_app/view/setting/presentation/controller/setting_cubit.dart';
import 'package:switch_app/view/store/data/datasource/store_remote_datasource.dart';
import 'package:switch_app/view/store/data/repository/store_repository.dart';
import 'package:switch_app/view/store/domain/repository/base_store_repository.dart';
import 'package:switch_app/view/store/domain/usecases/get_all_products.dart';
import 'package:switch_app/view/store/domain/usecases/make_order.dart';
import 'package:switch_app/view/store/presentation/controller/store_cubit.dart';
import 'package:switch_app/view/viewProfile/data/datasource/view_profile_remote_datasource.dart';
import 'package:switch_app/view/viewProfile/domain/repository/base_view_profle_repository.dart';
import 'package:switch_app/view/profile/domain/usecases/change_status_app.dart';
import 'package:switch_app/view/viewProfile/domain/usecases/get_user_data.dart';
import 'package:switch_app/view/viewProfile/presentation/controller/view_profile_cubit.dart';
import '../../view/activation/data/datasource/activation_remote_datasource.dart';
import '../../view/activation/data/repository/activation_repository.dart';
import '../../view/activation/domain/repository/base_activation_repository.dart';
import '../../view/addLinks/domain/usecases/get_social_apps.dart';
import '../../view/changePassword/data/datasource/change_password_remote_datasource.dart';
import '../../view/changePassword/data/repository/change_password_repository.dart';
import '../../view/changePassword/domain/repository/base_change_password_profile_repository.dart';
import '../../view/changePassword/presentation/controller/change_password_cubit.dart';
import '../../view/editProfile/data/repository/edit_profile_repository.dart';
import '../../view/editProfile/domain/repository/base_edit_profile_repository.dart';
import '../../view/editProfile/presentation/controller/edit_profile_cubit.dart';
import '../../view/forgetPassword/data/datasource/forget_password_remote_datasource.dart';
import '../../view/forgetPassword/data/repository/forget_password_repository.dart';
import '../../view/forgetPassword/domain/repository/base_forget_password_repository.dart';
import '../../view/forgetPassword/domain/usecases/forget_password.dart';
import '../../view/forgetPassword/presentation/controller/forget_password_cubit.dart';
import '../../view/help/data/datasource/help_remote_datasource.dart';
import '../../view/help/data/repository/help_repository.dart';
import '../../view/help/domain/repository/base_help_repository.dart';
import '../../view/help/presentation/controller/help_cubit.dart';
import '../../view/login/data/datasource/login_remote_datasource.dart';
import '../../view/login/data/repository/login_repository.dart';
import '../../view/login/domain/repository/base_login_repository.dart';
import '../../view/login/domain/usecases/login.dart';
import '../../view/myConnections/data/datasource/my_connection_remote_datasource.dart';
import '../../view/myConnections/data/repository/my_connection_repository.dart';
import '../../view/myConnections/domain/repository/base_my_connection_repository.dart';
import '../../view/myConnections/presentation/controller/my_connections_cubit.dart';
import '../../view/profile/data/datasource/profile_remote_datasource.dart';
import '../../view/profile/data/repository/profile_repository.dart';
import '../../view/profile/domain/repository/base_profle_repository.dart';
import '../../view/profile/domain/usecases/edit_app_details.dart';
import '../../view/profile/domain/usecases/show_app_details.dart';
import '../../view/profile/presentation/controller/profile_cubit.dart';
import '../../view/register/data/repository/register_repository.dart';
import '../../view/register/domain/repository/base_register_repository.dart';
import '../../view/register/domain/usecases/register.dart';
import '../../view/setting/data/datasource/setting_remote_datasource.dart';
import '../../view/setting/data/repository/setting_repository.dart';
import '../../view/setting/domain/repository/base_setting_repository.dart';
import '../../view/viewProfile/data/repository/view_profile_repository.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    // viewProfile
    sl.registerLazySingleton(() => ResetPassword(sl()));
    sl.registerLazySingleton(() => VerficationCode(sl()));
    sl.registerLazySingleton(() => ForgetPassword(sl()));
    sl.registerFactory(() => ForgetPasswordCubit(sl(), sl(), sl()));
    sl.registerLazySingleton<BaseForgetPasswordRepository>(
        () => ForgetPasswordRepository(sl()));

    sl.registerLazySingleton<BaseForgetPasswordRemoteDatasource>(
        () => ForgetPasswordRemoteDatasource());

    //profile
    sl.registerLazySingleton(() => DeleteApp(sl()));
    sl.registerLazySingleton(() => ChangeStatusApp(sl()));
    sl.registerLazySingleton(() => ShowAppDetails(sl()));
    sl.registerLazySingleton(() => EditAppDetails(sl()));
    sl.registerFactory(() => ProfileCubit(sl(), sl(), sl(), sl()));
    sl.registerLazySingleton<BaseProfileRepository>(
        () => ProfileRepository(sl()));

    sl.registerLazySingleton<BaseProfileRemoteDatasource>(
        () => ProfileRemoteDatasource());

    // viewProfile
    sl.registerLazySingleton(() => GetUserData(sl()));
    sl.registerFactory(() => ViewProfileCubit(sl()));
    sl.registerLazySingleton<BaseViewProfileRepository>(
        () => ViewProfileRepository(sl()));

    sl.registerLazySingleton<BaseViewProfileRemoteDatasource>(
        () => ViewProfileRemoteDatasource());

    // help
    sl.registerLazySingleton(() => GetHelp(sl()));
    sl.registerFactory(() => HelpCubit(sl()));

    sl.registerLazySingleton<BaseHelpRepository>(() => HelpRepository(sl()));

    sl.registerLazySingleton<BaseHelpRemoteDatasource>(
        () => HelpRemoteDatasource());

    // changePassword
    sl.registerLazySingleton(() => ChangePassword(sl()));
    sl.registerFactory(() => ChangePasswordCubit(sl()));

    sl.registerLazySingleton<BaseChangePasswordRepository>(
        () => ChangePasswordRepository(sl()));

    sl.registerLazySingleton<BaseChangePasswordRemoteDatasource>(
        () => ChangePasswordRemoteDatasource());

    // myConnection
    sl.registerLazySingleton(() => GetFavouriteList(sl()));
    sl.registerLazySingleton(() => GetConnectionList(sl()));
    sl.registerLazySingleton(() => GetExchangeList(sl()));
    sl.registerLazySingleton(() => FavouriteStatus(sl()));
    sl.registerLazySingleton(() => ExchangeStatus(sl()));
    sl.registerLazySingleton(() => AddNewConnection(sl()));
    sl.registerLazySingleton(() => DeleteConnection(sl()));
    sl.registerFactory(
        () => MyConnectionsCubit(sl(), sl(), sl(), sl(), sl(), sl(), sl()));

    sl.registerLazySingleton<BaseMyConnectionRepository>(
        () => MyConnectionRepository(sl()));

    sl.registerLazySingleton<BaseMyConnectionRemoteDatasource>(
        () => MyConnectionRemoteDatasource());

    // activation
    sl.registerLazySingleton(() => GetOrders(sl()));
    sl.registerLazySingleton(() => ActivationProduct(sl()));
    sl.registerFactory(() => ActivationCubit(sl(), sl()));

    sl.registerLazySingleton<BaseActivationRepository>(
        () => ActivationRepository(sl()));

    sl.registerLazySingleton<BaseActivationRemoteDatasource>(
        () => ActivationRemoteDatasource());

    // editProfile
    sl.registerLazySingleton(() => EditBackgroundImage(sl()));
    sl.registerLazySingleton(() => EditImage(sl()));
    sl.registerLazySingleton(() => EditProfile(sl()));
    sl.registerLazySingleton(() => GetProfile(sl()));
    sl.registerFactory(() => EditProfileCubit(sl(), sl(), sl(), sl()));

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
    sl.registerLazySingleton(() => GetMedia(sl()));
    sl.registerLazySingleton(() => DeleteAccount(sl()));
    sl.registerLazySingleton(() => Logout(sl()));
    sl.registerFactory(() => SettingCubit(sl(), sl(), sl()));

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
