import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telegramclone/data/models/user_model.dart';
import 'package:telegramclone/screens/home_screen/widget/show_avatar.dart';
import 'package:telegramclone/utils/app_colors.dart';
import 'package:telegramclone/utils/app_size.dart';
import 'package:telegramclone/utils/app_text_style.dart';

class UserItem extends StatelessWidget {
  const UserItem({
    super.key,
    required this.onTab,
    required this.userModel,
    this.isLast = false,
  });

  final VoidCallback onTab;
  final UserModel userModel;
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
                ShowAvatar(userModel: userModel, color: AppColors.c3355FF.withValues(alpha: 0.5)),
                8.getW(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userModel.userFullName,
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

