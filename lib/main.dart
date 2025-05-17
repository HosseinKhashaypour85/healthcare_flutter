import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthcare_flutter/features/intro_features/logic/cubit/splash_cubit.dart';
import 'package:healthcare_flutter/features/intro_features/screen/intro_screen.dart';
import 'package:healthcare_flutter/features/intro_features/screen/splash_screen.dart';

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
    return ScreenUtilInit(
      builder:
          (context, child) => MultiBlocProvider(
            providers: [BlocProvider(create: (context) => SplashCubit())],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: [Locale('fa')],
              initialRoute: BottomNavBarScreen.screenId,
              routes: {
                SplashScreen.screenId: (context) => SplashScreen(),
                IntroScreen.screenId: (context) => IntroScreen(),
                HomeScreen.screenId: (context) => HomeScreen(),
                BottomNavBarScreen.screenId: (context) => BottomNavBarScreen(),
              },
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
