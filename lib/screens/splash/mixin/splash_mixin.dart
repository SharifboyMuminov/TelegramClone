import 'package:flutter/material.dart';
import 'package:telegramclone/screens/auth/login/login_screen.dart';

mixin SplashScreenMixin {
  void checkUser(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LoginScreen();
          },
        ),
      );
    });
  }
}