import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:healthcare_flutter/features/home_features/logic/home_bloc.dart';
import 'package:healthcare_flutter/features/home_features/services/home_api_repository.dart';
import 'package:healthcare_flutter/features/intro_features/logic/cubit/splash_cubit.dart';
import 'package:healthcare_flutter/features/intro_features/screen/intro_screen.dart';
import 'package:healthcare_flutter/features/intro_features/screen/splash_screen.dart';
import 'package:healthcare_flutter/features/search_screen/screen/search_screen.dart';

import 'features/chat_features/screen/chat_screen.dart';
import 'features/home_features/screen/home_screen.dart';
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
      initialLocation: '/search',
      routes: [
        GoRoute(
          path: '/splash',
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: '/intro',
          builder: (context, state) => const IntroScreen(),
        ),
        GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
        GoRoute(
          path: '/bottom_nav_bar',
          builder: (context, state) => const BottomNavBarScreen(),
        ),
        GoRoute(path: '/chat', builder: (context, state) => const ChatScreen()),
        GoRoute(
          path: '/search',
          builder: (context, state) => const SearchScreen(),
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
