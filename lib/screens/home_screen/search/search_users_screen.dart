import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telegramclone/data/enums/forms_status.dart';
import 'package:telegramclone/data/repositories/search_repository.dart';
import 'package:telegramclone/screens/home_screen/search/cubit/search_cubit.dart';
import 'package:telegramclone/screens/home_screen/search/cubit/search_state.dart';
import 'package:telegramclone/screens/home_screen/widget/user_item.dart';
import 'package:telegramclone/screens/widget/auth_text_from_field.dart';
import 'package:telegramclone/utils/app_colors.dart';
import 'package:telegramclone/utils/app_size.dart';
import 'package:telegramclone/utils/app_text_style.dart';

class SearchingUsersScreen extends StatefulWidget {
  const SearchingUsersScreen({super.key});

  @override
  State<SearchingUsersScreen> createState() => _SearchingUsersScreenState();
}

class _SearchingUsersScreenState extends State<SearchingUsersScreen> {
  bool isFirstSearch = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchCubit>(
      create: (BuildContext context) =>
          SearchCubit(context.read<SearchRepository>()),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (BuildContext context, state) {
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
                "Qidiruv",
                style: AppTextStyle.poppinsSemiBold.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.c1A1A1A,
                ),
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.we, vertical: 10.he),
                  child: CostumeTextFromField(
                    onChanged: (v) {
                      context.read<SearchCubit>().searchUsers(userName: v);
                      isFirstSearch = true;
                    },
                    hintText: 'Qidiruv',
                    textInputAction: TextInputAction.done,
                  ),
                ),
                if (state.formsStatus == FormsStatus.loading)
                  CupertinoActivityIndicator(color: AppColors.c333333),
                if (state.users.isEmpty &&
                    isFirstSearch &&
                    state.formsStatus != FormsStatus.loading)
                  Text(
                    "Bunday foydalanuvshi mavjud emas",
                    style: AppTextStyle.poppinsSemiBold.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.users.length,
                    itemBuilder: (BuildContext context, int index) {
                      return UserItem(
                        onTab: () {},
                        userModel: state.users[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
