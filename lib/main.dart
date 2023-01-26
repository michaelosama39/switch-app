import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/view/bottomNav/presentation/screens/bottom_nav_screen.dart';
import 'package:switch_app/view/splash/presentation/screens/splash_screen.dart';
import 'core/appStorage/app_storage.dart';
import 'core/router/router.dart';
import 'core/services/services_locator.dart';
import 'core/utils/app_sizes.dart';
import 'firebase_options.dart';
import 'localization/language_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  ServicesLocator().init();
  WidgetsFlutterBinding.ensureInitialized();
  AppStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale _locale = Locale('en');

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }

  @override
  void initState() {
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      print("FirebaseMessaging: ${message}");
      if (message != null && AppStorage.getUserInfo != null) {
        MagicRouter.navigateTo(BottomNavScreen(selectedIndex: 3));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
          onGenerateRoute: onGenerateRoute,
          navigatorKey: navigatorKey,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: _locale,
          builder: (context, child) {
            AppSizes().init(context);
            return Directionality(
              textDirection: _locale.languageCode == 'en'
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              child: child!,
            );
          },
        );
      },
    );
  }
}
