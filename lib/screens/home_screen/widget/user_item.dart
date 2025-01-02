import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telegramclone/utils/app_colors.dart';
import 'package:telegramclone/utils/app_size.dart';
import 'package:telegramclone/utils/app_text_style.dart';

class UserItem extends StatelessWidget {
  const UserItem({
    super.key,
    required this.onTab,
    required this.title,
    required this.image,
    this.isLast = false,
  });

  final VoidCallback onTab;
  final String title;
  final String image;
  final bool isLast;

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
                  alignment: Alignment.center,
                  width: 48.we,
                  height: 48.we,
                  decoration: BoxDecoration(
                    color: generateRandomColor(),
                    shape: BoxShape.circle,
                  ),
                  child: image.isEmpty
                      ? Text(
                          title.substring(2),
                          style: AppTextStyle.poppinsMedium.copyWith(
                            fontSize: 20.sp,
                          ),
                        )
                      : SizedBox(),
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
          if (!isLast)
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

Color generateRandomColor() {
  final Random random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(128) + 127,
    random.nextInt(128) + 127,
    random.nextInt(129) + 127,
  );
}
