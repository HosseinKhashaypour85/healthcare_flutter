import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:healthcare_flutter/features/intro_features/screen/intro_screen.dart';
import 'package:healthcare_flutter/features/public_features/functions/pre_values/pre_values.dart';
import 'package:healthcare_flutter/features/public_features/functions/pref/shared_pref.dart';
import 'package:healthcare_flutter/features/public_features/functions/secure_storage/secure_storage.dart';
import 'package:healthcare_flutter/features/public_features/screen/bottom_nav_bar_screen.dart';

import '../../../const/theme/colors.dart';
import '../widget/textstyle_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String screenId = 'splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   navigate() {
    Timer(Duration(seconds: 3), () async {
      if (await SharedPref().getIntroStatus()) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          BottomNavBarScreen.screenId,
          (route) => false,
        );
      } else {
        Navigator.pushReplacementNamed(context, IntroScreen.screenId);
      }
    });
  }
  @override
  void initState() {
    super.initState();
    // navigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: box3Colors,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 70.h),
              Expanded(
                flex: 10,
                child: FadeInUp(
                  child: Column(
                    spacing: 10.sp,
                    children: [
                      Image.asset(PreValues().imageUrl),
                      Text('سلامت آنلاین', style: textStyleFunc(fontSize: 16.sp)),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: FadeInDown(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [SpinKitCircle(color: Colors.white)],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
