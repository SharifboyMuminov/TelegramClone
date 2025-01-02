import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:telegramclone/cubit/user/user_cubit.dart';
import 'package:telegramclone/cubit/user/user_state.dart';
import 'package:telegramclone/data/enums/forms_status.dart';
import 'package:telegramclone/screens/home_screen/profile/edit_profile.dart';
import 'package:telegramclone/screens/home_screen/profile/widget/profile_item.dart';
import 'package:telegramclone/screens/home_screen/profile/widget/show_avatar.dart';
import 'package:telegramclone/screens/home_screen/profile/widget/show_logout.dart';
import 'package:telegramclone/utils/app_colors.dart';
import 'package:telegramclone/utils/app_images.dart';
import 'package:telegramclone/utils/app_size.dart';
import 'package:telegramclone/utils/app_text_style.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 68.he,
        shape: Border(
          bottom: BorderSide(
            color: AppColors.c333333.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        title: Text(
          "Profil",
          style: AppTextStyle.poppinsSemiBold.copyWith(
            fontSize: 16.sp,
            color: AppColors.c1A1A1A,
          ),
        ),
      ),
      body: BlocConsumer<UserCubit, UserState>(
        builder: (BuildContext context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 20.he, top: 32.he),
            child: Column(
              children: [
                ShowAvatar(
                  imageUrl: state.userModel.imageUrl,
                  onChangedFile: (XFile value) {
                    context.read<UserCubit>().uploadImage(
                          file: File(value.path),
                          fileName: "users_images/${value.name}",
                        );
                  },
                ),
                16.getH(),
                Text(
                  state.userModel.userFullName,
                  style: AppTextStyle.poppinsSemiBold.copyWith(
                    fontSize: 24.sp,
                    color: AppColors.c1A1A1A,
                    height: 0,
                  ),
                ),
                Text(
                  state.userModel.userName,
                  style: AppTextStyle.poppinsRegular.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.c1A1A1A,
                  ),
                ),
                24.getH(),
                ProfileItem(
                  title: "Mening hisobim",
                  iconPath: AppImages.profileSvg,
                  onTab: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return EditProfileScreen(userModel: state.userModel);
                        },
                      ),
                    );
                  },
                ),
                ProfileItem(
                  title: "Chiqish",
                  iconPath: AppImages.logoutSvg,
                  onTab: () {
                    showLogout(context, onTabLogout: () {});
                  },
                ),
              ],
            ),
          );
        },
        listener: (BuildContext context, state) {
          if (state.formsStatus == FormsStatus.error) {
            sowErrorSnackBar(state.errorText);
          } else if (state.statusMessage == "pop") {
            Navigator.pop(context);
          }
        },
      ),
    );
  }

  void sowErrorSnackBar(String errorText) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        errorText,
        style: AppTextStyle.poppinsMedium.copyWith(
          color: AppColors.white,
          fontSize: 15.sp,
        ),
      ),
      backgroundColor: AppColors.cE61A1A,
      // Xatolik rangini ko'rsatish uchun qizil
      duration: const Duration(seconds: 2), // Qancha vaqt ko'rsatiladi
    ));
  }
}
