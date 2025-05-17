import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthcare_flutter/const/shape/border_radius.dart';
import 'package:healthcare_flutter/const/shape/media_query.dart';
import 'package:healthcare_flutter/const/theme/colors.dart';
import 'package:healthcare_flutter/features/intro_features/widget/textstyle_widget.dart';
import 'package:healthcare_flutter/features/public_features/functions/pref/shared_pref.dart';
import 'package:healthcare_flutter/features/public_features/screen/bottom_nav_bar_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  static const String screenId = 'intro';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/intro.jpg',
              width: getAllWidth(context),
              height: getAllHeight(context),
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.sp,
                  vertical: 40.sp,
                ),
                child: Center(
                  child: Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'هوشمندانه بخور',
                          style: textStyleFunc(fontSize: 20.sp),
                        ),
                        SizedBox(height: 10.sp),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'سالم زندگی کن',
                                    style: textStyleFunc(fontSize: 20.sp),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // gradient
            Container(
              width: getAllWidth(context),
              height: getAllHeight(context),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    box5Colors.withOpacity(0),
                    boxColors.withOpacity(0.7),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Spacer(),
            Expanded(
              flex: 7,
              child: Positioned(
                bottom: 50.sp,
                left: 0,
                right: 0,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(color: Colors.white, width: 1),
                          backgroundColor: box5Colors,
                          fixedSize: Size(
                            getAllWidth(context) - 10,
                            getHeight(context, 0.06.sp),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: getBorderRadiusFunc(5),
                          ),
                        ),
                        onPressed: () {
                          SharedPref().setIntroStatus();
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            BottomNavBarScreen.screenId,
                            (route) => false,
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'شروع سفر به دنیای سلامتی',
                              style: textStyleFunc(fontSize: 16.sp),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 20.sp,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
