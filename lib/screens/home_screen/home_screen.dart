import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegramclone/cubit/user/user_cubit.dart';
import 'package:telegramclone/screens/home_screen/search/search_users_screen.dart';

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
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchingUsersScreen();
                  },
                ),
              );
            },
            icon: Icon(CupertinoIcons.search),
            color: CupertinoColors.activeBlue,
          ),
        ],
      ),
    );
  }
}
