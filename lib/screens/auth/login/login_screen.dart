import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telegramclone/cubit/auth/auth_cubit.dart';
import 'package:telegramclone/cubit/auth/auth_state.dart';
import 'package:telegramclone/data/enums/forms_status.dart';
import 'package:telegramclone/screens/auth/mixin/auth_mixin.dart';
import 'package:telegramclone/screens/auth/sign_up/sign_up_screen.dart';
import 'package:telegramclone/screens/auth/widget/auth_text_from_field.dart';
import 'package:telegramclone/screens/home_screen/home_screen.dart';
import 'package:telegramclone/screens/widget/costume_button.dart';
import 'package:telegramclone/utils/app_colors.dart';
import 'package:telegramclone/utils/app_images.dart';
import 'package:telegramclone/utils/app_reg_exp.dart';
import 'package:telegramclone/utils/app_size.dart';
import 'package:telegramclone/utils/app_text_style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with AuthMixin {
  final formKey = GlobalKey<FormState>();
  String userName = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          builder: (BuildContext context, AuthState state) {
            return Form(
              autovalidateMode: AutovalidateMode.always,
              key: formKey,
              child: SingleChildScrollView(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.we, vertical: 25.he),
                child: Column(
                  children: [
                    60.getH(),
                    Image.asset(
                      AppImages.splashIconPng,
                      width: 110.we,
                      height: 110.we,
                    ),
                    28.getH(),
                    Text(
                      "Welcome to Scale Chat",
                      style: AppTextStyle.poppinsSemiBold.copyWith(
                        fontSize: 24.sp,
                        color: AppColors.c1A1A1A,
                      ),
                    ),
                    60.getH(),
                    AuthTextFromField(
                      onChanged: (v) {
                        setState(() {
                          userName = v;
                        });
                      },
                      hintText: "Foydalanuvchi nomi",
                      regExp: AppRegExp.userName,
                      errorText: "'@' va ' ' belgilardan tashqari bo'lsin",
                    ),
                    16.getH(),
                    AuthTextFromField(
                      onChanged: (v) {
                        setState(() {
                          password = v;
                        });
                      },
                      hintText: "Parol",
                      textInputAction: TextInputAction.done,
                      regExp: AppRegExp.passwordRegExp,
                      errorText: "mos keladigon parolni kiriting",
                    ),
                    16.getH(),
                    CostumeButton(
                      isLoading: state.formsStatus == FormsStatus.loading,
                      title: "Tizimga kirish",
                      onTab: () {
                        FocusScope.of(context).unfocus();
                        context
                            .read<AuthCubit>()
                            .login(userName: userName, password: password);
                      },
                      isActive: super.checkInput(userName, password),
                    ),
                    16.getH(),
                    CostumeButton(
                      title: "Yangi hisob yarating",
                      onTab: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SignUpScreen();
                            },
                          ),
                        );
                      },
                      backgroundColor: AppColors.cD0D8FF,
                      titleColor: AppColors.c333333,
                    ),
                  ],
                ),
              ),
            );
          },
          listener: (BuildContext context, AuthState state) {
            if (state.formsStatus == FormsStatus.authenticated) {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                builder: (context) {
                  return const HomeScreen();
                },
              ), (v) => false);
            } else if (state.formsStatus == FormsStatus.error) {
              super.sowErrorSnackBar(context, state.errorText);
            }
          },
        ),
      ),
    );
  }
}
