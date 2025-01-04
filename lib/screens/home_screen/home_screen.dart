import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegramclone/cubit/home/home_cubit.dart';
import 'package:telegramclone/cubit/home/home_state.dart';
import 'package:telegramclone/cubit/user/user_cubit.dart';
import 'package:telegramclone/data/enums/forms_status.dart';
import 'package:telegramclone/data/local/storage_repository.dart';
import 'package:telegramclone/screens/home_screen/chat_room/chat_room_screen.dart';
import 'package:telegramclone/screens/home_screen/widget/home_app_bar.dart';
import 'package:telegramclone/screens/home_screen/widget/user_item.dart';
import 'package:telegramclone/utils/app_colors.dart';
import 'package:telegramclone/utils/app_size.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    Future.microtask(() {
      context.read<UserCubit>().fetchUser();
      context.read<HomeCubit>().fetchUsers();
    });
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (BuildContext context, state) {
          if (state.formsStatus == FormsStatus.loading) {
            return Center(
                child: CupertinoActivityIndicator(color: AppColors.black));
          }

          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 20.he),
            itemCount: state.users.length,
            itemBuilder: (BuildContext context, int index) {
              return UserItem(
                isLast: false,
                onTab: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ChatRoomScreen(
                          userModel: state.users[index],
                        );
                      },
                    ),
                  );
                },
                userModel: state.users[index],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          StorageRepository.setString(key: "user_name", value: "");
        },
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      context.read<UserCubit>().setActiveProfile(true);
    } else if (state == AppLifecycleState.inactive) {
      context.read<UserCubit>().setActiveProfile();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
