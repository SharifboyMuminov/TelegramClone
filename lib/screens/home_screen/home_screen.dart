import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegramclone/cubit/user/user_cubit.dart';
import 'package:telegramclone/screens/home_screen/chat_room/chat_room_screen.dart';
import 'package:telegramclone/screens/home_screen/widget/home_app_bar.dart';
import 'package:telegramclone/screens/home_screen/widget/user_item.dart';
import 'package:telegramclone/utils/app_size.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Future.microtask(() {
      context.read<UserCubit>().fetchUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 20.he),
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return UserItem(
            isLast: 14 == index,
            onTab: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ChatRoomScreen();
                  },
                ),
              );
            },
            title: "asdf",
            image: '',
          );
        },
      ),
    );
  }
}
