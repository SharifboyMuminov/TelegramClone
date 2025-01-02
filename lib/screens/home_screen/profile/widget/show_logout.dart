import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telegramclone/screens/widget/costume_button.dart';
import 'package:telegramclone/utils/app_colors.dart';
import 'package:telegramclone/utils/app_size.dart';
import 'package:telegramclone/utils/app_text_style.dart';

void showLogout(
  BuildContext context, {
  required VoidCallback onTabLogout,
}) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.only(
          top: 6.he,
          left: 16.we,
          right: 16.we,
          bottom: 50.he,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              child: Container(
                width: 32.we,
                height: 6.he,
                decoration: BoxDecoration(
                  color: AppColors.cF2F2F2,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            SizedBox(width: width),
            12.getH(),
            Text(
              "Ishonchingiz komilmi?",
              style: AppTextStyle.poppinsSemiBold.copyWith(
                fontSize: 20.sp,
                color: AppColors.c1A1A1A,
              ),
            ),
            8.getH(),
            Text(
              "Kirish ekraniga qaytasiz.",
              style: AppTextStyle.poppinsRegular.copyWith(
                fontSize: 16.sp,
                color: AppColors.c333333,
              ),
            ),
            24.getH(),
            CostumeButton(
              title: "Ha, tizimdan chiqing",
              onTab: onTabLogout,
            ),
            8.getH(),
            CostumeButton(
              titleColor: AppColors.c333333,
              backgroundColor: AppColors.cD0D8FF,
              title: "Bekor qilish",
              onTab: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
