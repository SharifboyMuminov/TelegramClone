import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telegramclone/cubit/user/user_cubit.dart';
import 'package:telegramclone/data/enums/forms_status.dart';
import 'package:telegramclone/data/models/user_model.dart';
import 'package:telegramclone/screens/widget/auth_text_from_field.dart';
import 'package:telegramclone/screens/widget/costume_button.dart';
import 'package:telegramclone/utils/app_colors.dart';
import 'package:telegramclone/utils/app_reg_exp.dart';
import 'package:telegramclone/utils/app_size.dart';
import 'package:telegramclone/utils/app_text_style.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key, required this.userModel});

  final UserModel userModel;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _controllerUserName = TextEditingController();
  final TextEditingController _controllerUserFullName = TextEditingController();

  @override
  void initState() {
    _controllerUserName.text = widget.userModel.userName.replaceAll("@", "");
    _controllerUserFullName.text = widget.userModel.userFullName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop:
          context.watch<UserCubit>().state.formsStatus != FormsStatus.loading,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 68.he,
          shape: Border(
            bottom: BorderSide(
              color: AppColors.c333333.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          title: Text(
            "Profil tahrirlash",
            style: AppTextStyle.poppinsSemiBold.copyWith(
              fontSize: 16.sp,
              color: AppColors.c1A1A1A,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20.he, horizontal: 16.we),
          child: Column(
            children: [
              CostumeTextFromField(
                onChanged: (v) => setState(() {}),
                controller: _controllerUserFullName,
                hintText: "To'liq nom",
                errorText: "Iltimos tu'g'ri formatda kiriting",
                regExp: AppRegExp.userFulNameRegExp,
              ),
              10.getH(),
              CostumeTextFromField(
                onChanged: (v) => setState(() {}),
                controller: _controllerUserName,
                hintText: "Foydalanuvchi nomi",
                textInputAction: TextInputAction.done,
                errorText: "Iltimos tu'g'ri formatda kiriting",
                regExp: AppRegExp.userNameRegExp,
              ),
              30.getH(),
              CostumeButton(
                isLoading: context.watch<UserCubit>().state.formsStatus ==
                    FormsStatus.loading,
                isActive: checkInput(),
                title: "Saqlsh",
                onTab: () {
                  context.read<UserCubit>().updateUserFild(
                        message: "pop",
                        userModel: widget.userModel.copyWith(
                          userName: "@${_controllerUserName.text}",
                          userFullName: _controllerUserFullName.text,
                        ),
                      );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool checkInput() {
    return (AppRegExp.userNameRegExp.hasMatch(_controllerUserName.text) &&
            AppRegExp.userFulNameRegExp
                .hasMatch(_controllerUserFullName.text) &&
            _controllerUserName.text.length > 2) &&
        (widget.userModel.userFullName != _controllerUserFullName.text ||
            widget.userModel.userName.replaceAll("@", "") !=
                _controllerUserName.text);
  }

  @override
  void dispose() {
    _controllerUserName.dispose();
    _controllerUserFullName.dispose();
    super.dispose();
  }
}
