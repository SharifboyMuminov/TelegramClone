import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telegramclone/utils/app_colors.dart';
import 'package:telegramclone/utils/app_size.dart';
import 'package:telegramclone/utils/app_text_style.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key,
    required this.title,
    required this.isMyMessage,
  });

  final String title;
  final bool isMyMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 4.he,
        top: 4.he,
        left: isMyMessage ? 25.we : 5.we,
        right: !isMyMessage ? 25.we : 5.we,
      ),
      child: Align(
        alignment: isMyMessage ? Alignment.topRight : Alignment.topLeft,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: isMyMessage ? AppColors.c3355FF : AppColors.cF2F2F2,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              topRight: Radius.circular(10.r),
              bottomRight: isMyMessage ? Radius.zero : Radius.circular(10.r),
              bottomLeft: isMyMessage ? Radius.circular(10.r) : Radius.zero,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.he, horizontal: 16.we),
            child: Text(
              "Hello... do you DJENT?",
              style: AppTextStyle.poppinsRegular.copyWith(
                fontSize: 16.sp,
                color: isMyMessage ? AppColors.white : AppColors.c333333,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
