import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telegramclone/cubit/auth/auth_cubit.dart';
import 'package:telegramclone/cubit/home/home_cubit.dart';
import 'package:telegramclone/cubit/user/user_cubit.dart';
import 'package:telegramclone/data/repositories/auth_repository.dart';
import 'package:telegramclone/data/repositories/chat_repository.dart';
import 'package:telegramclone/data/repositories/home_repository.dart';
import 'package:telegramclone/data/repositories/image_upload_repository.dart';
import 'package:telegramclone/data/repositories/search_repository.dart';
import 'package:telegramclone/data/repositories/user_repository.dart';
import 'package:telegramclone/screens/splash/splash_screen.dart';
import 'package:telegramclone/utils/app_colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => AuthRepository(),
        ),
        RepositoryProvider(
          create: (_) => UserRepository(),
        ),
        RepositoryProvider(
          create: (_) => SearchRepository(),
        ),
        RepositoryProvider(
          create: (_) => ImageUploadRepository(),
        ),
        RepositoryProvider(
          create: (_) => HomeRepository(),
        ),
        RepositoryProvider(
          create: (_) => ChatRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(
              context.read<AuthRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => HomeCubit(
              context.read<HomeRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => UserCubit(
              context.read<UserRepository>(),
              context.read<ImageUploadRepository>(),
            ),
          ),
        ],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (context, child) {
        ScreenUtil.init(context);
        return AnnotatedRegion(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.light,
          ),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: AppColors.white,
              appBarTheme: const AppBarTheme(
                backgroundColor: AppColors.white,
                surfaceTintColor: Colors.transparent,
              ),
            ),
            home: child,
          ),
        );
      },
      child: const SplashScreen(),
    );
  }
}
