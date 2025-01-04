import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:telegramclone/screens/home_screen/dialogs/image_question_dialog.dart';
import 'package:telegramclone/utils/app_colors.dart';
import 'package:telegramclone/utils/app_size.dart';

class ShowAvatarProfile extends StatelessWidget {
  const ShowAvatarProfile({
    super.key,
    required this.imageUrl,
    required this.onChangedFile,
  });

  final String imageUrl;
  final ValueChanged<XFile> onChangedFile;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl.isEmpty
          ? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
          : imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        alignment: Alignment.topRight,
        width: 112.we,
        height: 96.he,
        decoration: BoxDecoration(
          color: AppColors.c666666,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: AppColors.c3355FF,
              ),
              icon: Icon(
                size: 16.sp,
                Icons.add,
                color: AppColors.white,
              ),
              onPressed: () {
                showImageDialog(context, onChaneXFile: (XFile? value) {
                  if (value != null) {
                    onChangedFile.call(value);
                  }
                });
              },
            ),
          ],
        ),
      ),
      placeholder: (context, url) =>
          CupertinoActivityIndicator(color: AppColors.black),
      errorWidget: (context, url, error) {
        return Container(
          alignment: Alignment.topRight,
          width: 112.we,
          height: 96.he,
          decoration: BoxDecoration(
            color: AppColors.c666666,
            shape: BoxShape.circle,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.c3355FF,
                ),
                icon: Icon(
                  size: 16.sp,
                  Icons.add,
                  color: AppColors.white,
                ),
                onPressed: () {
                  showImageDialog(context, onChaneXFile: (XFile? value) {
                    if (value != null) {
                      onChangedFile.call(value);
                    }
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
