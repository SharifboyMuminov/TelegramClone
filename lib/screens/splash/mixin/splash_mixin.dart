import 'package:flutter/material.dart';
import 'package:telegramclone/data/local/storage_repository.dart';
import 'package:telegramclone/screens/auth/login/login_screen.dart';
import 'package:telegramclone/screens/home_screen/home_screen.dart';

mixin SplashScreenMixin {
  void checkUser(BuildContext context) {
    String userName = StorageRepository.getString(key: "user_name");
    Future.delayed(Duration(seconds: 1), () {
      if (userName.isNotEmpty) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return HomeScreen();
            },
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return LoginScreen();
            },
          ),
        );
      }
    });
  }
}
