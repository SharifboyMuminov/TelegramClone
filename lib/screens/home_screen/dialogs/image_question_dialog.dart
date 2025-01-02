import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:telegramclone/screens/home_screen/dialogs/widget/image_dialog_button.dart';
import 'package:telegramclone/utils/app_colors.dart';
import 'package:telegramclone/utils/app_size.dart';
import 'package:telegramclone/utils/app_text_style.dart';

showImageDialog(
    BuildContext context, {
      required ValueChanged<XFile?> onChaneXFile,
    }) async {
  XFile? xFile;

  Future<void> pickerImageFromGallery() async {
    xFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 1024,
      maxWidth: 1024,
    );

    onChaneXFile.call(xFile);
  }

  Future<void> pickerImageFromCamera() async {
    xFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 1024,
      maxWidth: 1024,
    );
    onChaneXFile.call(xFile);
  }

  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.white,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.r),
          topRight: Radius.circular(15.r),
        )),
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: 40.he,
          left: 15.we,
          right: 15.we,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            10.getH(),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 84.we,
                height: 5.he,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.cEFEFEF,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                ),
              ),
            ),
            10.getH(),
            Text(
              "Rasmni tanlash uchun",
              style: AppTextStyle.poppinsRegular.copyWith(
                fontSize: 18.sp,
                color: AppColors.c303030.withValues(alpha:  0.9),
              ),
            ),
            8.getH(),
            ImageDialogButtons(
              iconData: Icons.camera_alt,
              title: "Kamera yoramida",
              onTab: () {
                pickerImageFromCamera();
                Navigator.pop(context);
              },
            ),
            5.getW(),
            ImageDialogButtons(
              iconData: Icons.folder,
              title: "Fayllardan tanlab",
              onTab: () {
                pickerImageFromGallery();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}