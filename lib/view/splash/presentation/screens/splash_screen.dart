import 'dart:async';

import 'package:flutter/material.dart';
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
    Timer(const Duration(seconds: 5), () {
      MagicRouter.navigateAndPopAll(const LoginScreen());
      // if (AppStorage.getUserInfo == null) {
      //   MagicRouter.navigateAndPopAll(const LoginScreen());
      // } else {
      //   MagicRouter.navigateAndPopAll(const HomeScreen());
      // }
    });
  }

  Future getData() async {
    BaseLoginRemoteDatasource baseLoginRemoteDatasource =
        LoginRemoteDatasource();
    BaseLoginRepository baseLoginRepository =
        LoginRepository(baseLoginRemoteDatasource);
    Login login = Login(baseLoginRepository);
    final res = await login.execute('mrmohamedsultan7@gmail.com', '123456');
  }

  @override
  void initState() {
    _splashTimer();
    // getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }
}
