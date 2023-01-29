import 'package:get_storage/get_storage.dart';
import '../../view/login/presentation/screens/login_screen.dart';
import '../models/user_model.dart';
import '../router/router.dart';

abstract class AppStorage {
  static GetStorage _box = GetStorage();

  static Future<void> init() async => await GetStorage.init();

  static UserModel? get getUserInfo {
    if (_box.hasData('user')) return UserModel.fromJson(_box.read('user'));
  }

  static String? get getPassword {
    if (_box.hasData('password')) return _box.read('password');
  }

  static String? get getToken {
    if (_box.hasData('token')) return _box.read('token');
  }

  static String get getLang {
    if (_box.hasData('language')) {
      return _box.read('language');
    }
    return 'en';
  }

  static bool get isLogged => getUserInfo != null;

  static Future<void> cacheUserInfo(UserModel userModel) =>
      _box.write('user', userModel.toJson());

  static Future<void> cacheLang(String lang) => _box.write('language', lang);

  static Future<void> cachePasswordUserInfo(String passwoed) =>
      _box.write('password', passwoed);

  static Future<void> cacheToken(String token) =>
      _box.write('token', token);

  static int get getUserId => getUserInfo!.data!.id!;

  static String get getCurrentLang => getLang;

  static String get getPasswordUserInfo => getPassword!;
  static String get getTokenInfo => getToken!;

  static UserModel get getUserData => getUserInfo!;

  static Future<void> signOut() async {
    await _box.erase();
    MagicRouter.navigateAndPopAll(LoginScreen());
  }
}
