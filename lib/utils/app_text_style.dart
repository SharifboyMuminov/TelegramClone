import 'package:flutter/material.dart';
import 'package:telegramclone/utils/app_colors.dart';

sealed class AppTextStyle {
  AppTextStyle._();

  static TextStyle poppinsThin = const TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.w200,
    color: AppColors.black,
  );
  static TextStyle poppinsLight = const TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.w300,
    color: AppColors.black,
  );
  static TextStyle poppinsRegular = const TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );
  static TextStyle poppinsMedium = const TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );

  static TextStyle poppinsSemiBold = const TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static TextStyle poppinsBold = const TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

  static TextStyle poppinsBlack = const TextStyle(
    fontFamily: "Poppins",
    fontWeight: FontWeight.w800,
    color: AppColors.black,
  );
}
