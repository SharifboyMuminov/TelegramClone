import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telegramclone/utils/app_colors.dart';
import 'package:telegramclone/utils/app_reg_exp.dart';
import 'package:telegramclone/utils/app_text_style.dart';

mixin AuthMixin {
  bool checkInput(String userName, String password) {
    return AppRegExp.passwordRegExp.hasMatch(password) &&
        AppRegExp.userNameRegExp.hasMatch(userName);
  }

  void sowErrorSnackBar(BuildContext context, String errorText) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(

      content: Text(
        errorText,
        style: AppTextStyle.poppinsMedium.copyWith(
          color: AppColors.white,
          fontSize: 15.sp,
        ),
      ),
      backgroundColor: AppColors.cE61A1A, // Xatolik rangini ko'rsatish uchun qizil
      duration: const Duration(seconds: 2), // Qancha vaqt ko'rsatiladi
    ));
  }
}
