import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:telegramclone/utils/app_colors.dart';
import 'package:telegramclone/utils/app_size.dart';
import 'package:telegramclone/utils/app_text_style.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.title,
    required this.iconPath,
    required this.onTab,
  });

  final String title;
  final String iconPath;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: 24.we,
          vertical: 12.he,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
      onPressed: onTab,
      child: Row(
        children: [
          SvgPicture.asset(
            iconPath,
            width: 24.we,
            height: 24.we,
          ),
          8.getW(),
          Text(
            title,
            style: AppTextStyle.poppinsRegular.copyWith(
              fontSize: 16.sp,
              color: AppColors.c333333,
            ),
          ),
        ],
      ),
    );
  }
}
