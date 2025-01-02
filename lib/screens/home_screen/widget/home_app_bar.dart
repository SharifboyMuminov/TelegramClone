import 'dart:ui' as size;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telegramclone/screens/home_screen/profile/profile_screen.dart';
import 'package:telegramclone/screens/home_screen/search/search_users_screen.dart';
import 'package:telegramclone/utils/app_colors.dart';
import 'package:telegramclone/utils/app_size.dart';
import 'package:telegramclone/utils/app_text_style.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 68.he,
      shape: Border(
        bottom: BorderSide(
          color: AppColors.c333333.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      leading: Padding(
        padding: EdgeInsets.only(left: 5.we),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ProfileScreen();
                },
              ),
            );
          },
          child: Container(
            alignment: Alignment.center,
            width: 32.we,
            height: 32.we,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.cF2F2F2,
            ),
            child: Text(
              "SH",
              style: AppTextStyle.poppinsRegular.copyWith(
                fontSize: 14.sp,
                color: AppColors.c333333,
              ),
            ),
          ),
        ),
      ),
      title: Text(
        "Suhbatlar",
        style: AppTextStyle.poppinsSemiBold.copyWith(
          fontSize: 16.sp,
          color: AppColors.c1A1A1A,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SearchingUsersScreen();
                },
              ),
            );
          },
          icon: Icon(CupertinoIcons.search),
          color: CupertinoColors.activeBlue,
        ),
      ],
    );
  }

  @override
  size.Size get preferredSize => size.Size.fromHeight(68.he);
}
