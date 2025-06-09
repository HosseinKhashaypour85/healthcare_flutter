import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:healthcare_flutter/features/auth_features/logic/auth_bloc.dart';
import 'package:healthcare_flutter/features/auth_features/screen/auth_screen.dart';
import 'package:healthcare_flutter/features/auth_features/services/auth_api_repository.dart';
import 'package:healthcare_flutter/features/home_features/logic/home_bloc.dart';
import 'package:healthcare_flutter/features/home_features/services/home_api_repository.dart';
import 'package:healthcare_flutter/features/intro_features/logic/cubit/splash_cubit.dart';
import 'package:healthcare_flutter/features/intro_features/screen/intro_screen.dart';
import 'package:healthcare_flutter/features/intro_features/screen/splash_screen.dart';
import 'package:healthcare_flutter/features/profile_features/screen/check_profile.dart';
import 'package:healthcare_flutter/features/public_features/logic/token_check/token_check_cubit.dart';
import 'package:healthcare_flutter/features/search_screen/screen/search_screen.dart';

import 'features/chat_features/screen/chat_screen.dart';
import 'features/home_features/screen/home_screen.dart';
import 'features/profile_features/screen/profile_screen.dart';
import 'features/public_features/screen/bottom_nav_bar_screen.dart';

void main() {
  runApp(const MyApp());
  HttpOverrides.global = MyHttpOverrides();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      initialLocation: '/auth',
      routes: [
        GoRoute(
          path: '/splash',
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          name: 'intro',
          path: '/intro',
          builder: (context, state) => const IntroScreen(),
        ),
        GoRoute(
          name: 'home',
          path: '/home', // این بخش باید اضافه شود
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          name: 'bottom_nav_bar',
          path: '/bottom_nav_bar',
          builder: (context, state) => const BottomNavBarScreen(),
        ),
        GoRoute(path: '/chat', builder: (context, state) => const ChatScreen()),
        GoRoute(
          name: 'search',
          path: '/search',
          builder: (context, state) => const SearchScreen(),
        ),
        GoRoute(
          name: 'profile',
          path: '/profile',
          builder: (context, state) => ProfileScreen(),
        ),
        GoRoute(
          name: 'checkProfile',
          path: '/checkProfile',
          builder: (context, state) => CheckProfile(),
        ),
        GoRoute(
          name: 'auth',
          path: '/auth',
          builder: (context, state) => AuthScreen(),
        ),
      ],
      errorBuilder: (context, state) {
        return Scaffold(
          body: Center(child: Text('Page not found: ${state.error}')),
        );
      },
    );

    return ScreenUtilInit(
      builder:
          (context, child) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => SplashCubit()),
              BlocProvider(create: (context) => HomeBloc(HomeApiRepository())),
              BlocProvider(create: (context) => TokenCheckCubit()),
              BlocProvider(create: (context) => AuthBloc(AuthApiRepository())),
            ],
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [Locale('fa')], // پشتیبانی از زبان فارسی
              routerConfig: _router, // استفاده از روتر برای ناوبری
            ),
          ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
