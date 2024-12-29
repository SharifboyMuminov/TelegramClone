import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telegramclone/utils/app_colors.dart';
import 'package:telegramclone/utils/app_size.dart';
import 'package:telegramclone/utils/app_text_style.dart';

class CostumeButton extends StatelessWidget {
  const CostumeButton({
    super.key,
    required this.title,
    required this.onTab,
    this.backgroundColor,
    this.titleColor,
    this.isActive = true,
  });

  final String title;
  final bool isActive;
  final VoidCallback onTab;
  final Color? titleColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 12.he),
          backgroundColor: isActive
              ? backgroundColor ?? AppColors.c3355FF
              : AppColors.c666666.withValues(alpha: 0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        onPressed: isActive ? onTab : null,
        child: Text(
          title,
          style: AppTextStyle.poppinsSemiBold.copyWith(
            fontSize: 16.sp,
            color: titleColor ?? AppColors.white,
          ),
        ),
      ),
    );
  }
}
