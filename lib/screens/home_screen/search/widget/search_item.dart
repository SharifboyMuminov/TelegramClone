import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telegramclone/utils/app_colors.dart';
import 'package:telegramclone/utils/app_size.dart';
import 'package:telegramclone/utils/app_text_style.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({
    super.key,
    required this.onTab,
    required this.title,
  });

  final VoidCallback onTab;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTab,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.we, vertical: 12.he),
            child: Row(
              children: [
                Container(
                  width: 48.we,
                  height: 48.we,
                  decoration: BoxDecoration(
                    color: AppColors.cD0D8FF,
                    shape: BoxShape.circle,
                  ),
                ),
                8.getW(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyle.poppinsRegular.copyWith(
                        fontSize: 16.sp,
                        color: AppColors.c333333,
                      ),
                    ),
                    // Text(
                    //   "You: Here’s the result 😀. 4:57pm",
                    //   style: AppTextStyle.poppinsRegular.copyWith(
                    //     fontSize: 14.sp,
                    //     color: AppColors.c666666,
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 1.he,
            color: AppColors.cD0D8FF,
          ),
        ],
      ),
    );
  }
}
