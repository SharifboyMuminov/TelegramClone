import 'package:flutter/material.dart';
import 'package:telegramclone/screens/splash/mixin/splash_mixin.dart';
import 'package:telegramclone/utils/app_images.dart';
import 'package:telegramclone/utils/app_size.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SplashScreenMixin {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    super.checkUser(context);

    return Scaffold(
      body: Center(
        child: Image.asset(
          AppImages.splashIconPng,
          width: 130.we,
          height: 130.we,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
