import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:switch_app/view/login/data/datasource/login_remote_datasource.dart';
import 'package:switch_app/view/login/data/repository/login_repository.dart';
import 'package:switch_app/view/login/domain/repository/base_login_repository.dart';
import 'package:switch_app/view/login/domain/usecases/login.dart';
import 'package:switch_app/view/splash/presentation/screens/splash_screen.dart';
import 'core/router/router.dart';
import 'core/services/services_locator.dart';
import 'core/utils/app_sizes.dart';

void main() {
  ServicesLocator().init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          theme: ThemeData(
            fontFamily: 'Cairo',
          ),
          onGenerateRoute: onGenerateRoute,
          navigatorKey: navigatorKey,
          builder: (context, child) {
            AppSizes().init(context);
            return Directionality(
              textDirection: TextDirection.ltr,
              child: Container(
                color: Colors.white,
                child: child!,
              ),
            );
          },
        );
      },
    );
  }
}
