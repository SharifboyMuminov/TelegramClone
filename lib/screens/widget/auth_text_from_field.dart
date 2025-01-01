import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telegramclone/utils/app_colors.dart';
import 'package:telegramclone/utils/app_size.dart';
import 'package:telegramclone/utils/app_text_style.dart';

class CostumeTextFromField extends StatelessWidget {
  const CostumeTextFromField({
    super.key,
    this.hintText,
    this.controller,
    this.onChanged,
    this.textInputAction,
    this.textInputType,
    this.regExp,
    this.errorText,
  });

  final String? hintText;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final Function(String v)? onChanged;
  final RegExp? regExp;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction ?? TextInputAction.next,
      keyboardType: textInputType ?? TextInputType.text,
      cursorColor: AppColors.c1A1A1A,
      controller: controller,
      onChanged: onChanged,
      validator: (String? value) {
        if (regExp != null) {
          if (value == null ||
              !regExp!.hasMatch(value) ||
              value.isEmpty ||
              value.length < 3) {
            return errorText;
          } else {
            return null;
          }
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: AppTextStyle.poppinsMedium.copyWith(
        color: AppColors.c1A1A1A,
        fontSize: 16.sp,
      ),
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.we, vertical: 12.he),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: AppColors.c1A1A1A, width: 1.we),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: AppColors.cB3B3B3, width: 1.we),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(
                color: AppColors.cE61A1A.withValues(alpha: 0.5), width: 1.we),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: AppColors.cE61A1A, width: 1.we),
          ),
          filled: true,
          fillColor: AppColors.white,
          hintText: hintText,
          hintStyle: AppTextStyle.poppinsRegular.copyWith(
            fontSize: 16.sp,
            color: AppColors.c666666,
          ),
          errorStyle: AppTextStyle.poppinsRegular.copyWith(
            fontSize: 14.sp,
            color: AppColors.cBA1515,
          )),
    );
  }
}
