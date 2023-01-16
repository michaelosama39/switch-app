import 'dart:async';

import 'package:flutter/material.dart';
import 'package:switch_app/view/bottomNav/presentation/screens/bottom_nav_screen.dart';
import '../../../../core/appStorage/app_storage.dart';
import '../../../../core/router/router.dart';
import '../../../login/data/datasource/login_remote_datasource.dart';
import '../../../login/data/repository/login_repository.dart';
import '../../../login/domain/repository/base_login_repository.dart';
import '../../../login/domain/usecases/login.dart';
import '../../../login/presentation/screens/login_screen.dart';
import '../widgets/splash_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _splashTimer() {
    Timer(const Duration(seconds: 3), () {
      print(AppStorage.getUserInfo);
      if (AppStorage.getUserInfo == null) {
        MagicRouter.navigateAndPopAll(const LoginScreen());
      } else {
        MagicRouter.navigateAndPopAll(BottomNavScreen());
      }
    });
  }

  @override
  void initState() {
    _splashTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }
}
