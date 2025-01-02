import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telegramclone/utils/app_colors.dart';
import 'package:telegramclone/utils/app_size.dart';
import 'package:telegramclone/utils/app_text_style.dart';

class ImageDialogButtons extends StatelessWidget {
  const ImageDialogButtons({
    super.key,
    required this.onTab,
    required this.title, required this.iconData,
  });

  final VoidCallback onTab;
  final String title;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.cEFEFEF,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.we, vertical: 6.we),
      ),
      onPressed: onTab,
      child: Row(
        children: [
          Icon(
            iconData,
            color: AppColors.c474747,
            size: 23.sp,
          ),
          8.getW(),
          Text(
            title,
            style: AppTextStyle.poppinsMedium.copyWith(
              fontSize: 14.sp,
              color: AppColors.c474747,
            ),
          ),
        ],
      ),
    );
  }
}