import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/core/appStorage/app_storage.dart';
import 'package:switch_app/view/splash/presentation/screens/splash_screen.dart';
import 'core/router/router.dart';
import 'core/services/services_locator.dart';
import 'core/utils/app_sizes.dart';
import 'localization/language_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  ServicesLocator().init();
  WidgetsFlutterBinding.ensureInitialized();
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
  Locale? _locale;

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
              textDirection: _locale!.languageCode == 'en'? TextDirection.ltr : TextDirection.rtl,
              child: child!,
            );
          },
        );
      },
    );
  }
}
