import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telegramclone/data/models/user_model.dart';
import 'package:telegramclone/utils/app_colors.dart';
import 'package:telegramclone/utils/app_size.dart';
import 'package:telegramclone/utils/app_text_style.dart';

class ShowAvatar extends StatelessWidget {
  const ShowAvatar({
    super.key,
    required this.userModel,
    this.color,
  });

  final UserModel userModel;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return userModel.imageUrl.isNotEmpty ? CachedNetworkImage(
      imageUrl: userModel.imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        width: 52.we,
        height: 52.we,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            width: 13.we,
            height: 13.we,
            decoration: BoxDecoration(
              color: userModel.isOnline
                  ? Colors.lightGreenAccent
                  : AppColors.c9E9E9E,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
      placeholder: (context, url) =>
          CupertinoActivityIndicator(color: AppColors.c3355FF),
      errorWidget: (context, url, error) {
        return Container(
          width: 52.we,
          height: 52.we,
          decoration: BoxDecoration(
            color: color ?? AppColors.c333333.withValues(alpha: 0.5),
            shape: BoxShape.circle,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                userModel.userFullName.substring(0, 2),
                style: AppTextStyle.poppinsMedium.copyWith(
                  fontSize: 20.sp,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 13.we,
                  height: 13.we,
                  decoration: BoxDecoration(
                    color: userModel.isOnline
                        ? Colors.lightGreenAccent
                        : AppColors.cB3B3B3,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ) : Container(
      width: 52.we,
      height: 52.we,
      decoration: BoxDecoration(
        color: color ?? AppColors.c333333.withValues(alpha: 0.5),
        shape: BoxShape.circle,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            userModel.userFullName.substring(0, 2),
            style: AppTextStyle.poppinsMedium.copyWith(
              fontSize: 20.sp,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 13.we,
              height: 13.we,
              decoration: BoxDecoration(
                color: userModel.isOnline
                    ? Colors.lightGreenAccent
                    : AppColors.cB3B3B3,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
