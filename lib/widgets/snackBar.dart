import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../core/router/router.dart';
import '../core/utils/app_colors.dart';

showSnackBar(String massage,
    {bool popPage = false, duration = 5, Color color = AppColors.primaryColor}) {
  ScaffoldMessenger.of(MagicRouter.currentContext!).hideCurrentSnackBar();
  ScaffoldMessenger.of(MagicRouter.currentContext!).showSnackBar(
    SnackBar(
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      content: Text(
        massage,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      action: SnackBarAction(
        label: '',
        onPressed: () {},
      ),
      duration: Duration(seconds: duration),
    ),
  );
  if (popPage) Timer(const Duration(seconds: 5), () => MagicRouter.pop());
}