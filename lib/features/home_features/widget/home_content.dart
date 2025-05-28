import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:healthcare_flutter/features/home_features/model/home_model.dart';
import 'package:healthcare_flutter/features/home_features/widget/food_section_content.dart';
import 'package:healthcare_flutter/features/home_features/widget/health_card_widget.dart';
import 'package:healthcare_flutter/features/home_features/widget/progress_bar_widget.dart';
import 'package:healthcare_flutter/features/home_features/widget/quick_action_widget.dart';
import 'package:intl/intl.dart';

import '../../../const/shape/border_radius.dart';
import '../../../const/theme/colors.dart';
import '../functions/get_current_date_func.dart';
import '../functions/get_greeting_func.dart';
import 'build_icon_button.dart';
import 'date_info_widget.dart';

class HomeContent extends StatefulWidget {
  final HomeModel homeModel;
  const HomeContent({super.key, required this.homeModel});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              height: 220.sp,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [boxColors, boxColors.withOpacity(0.9)],
                ),
              ),
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.sp,
                      vertical: 20.sp,
                    ),
                    child: Column(
                      children: [
                        // App Bar
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 8.sp),
                                buildIconButton(
                                  icon: Icons.notifications_active_outlined,
                                  onPressed: () {},
                                  showBadge: true,
                                ),
                                buildIconButton(
                                  icon: Icons.search,
                                  onPressed: () {
                                    context.push('/search');
                                  },
                                ),
                              ],
                            ),
                            // User Profile
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      getGreeting(),
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.white.withOpacity(0.8),
                                        fontFamily: 'irs',
                                      ),
                                    ),
                                    Text(
                                      'کاربر مهمان',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontFamily: 'irs',
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 10.sp),
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2.sp,
                                    ),
                                  ),
                                  child: CircleAvatar(
                                    radius: 22.sp,
                                    backgroundColor: primaryColor,
                                    child: Icon(
                                      Icons.person_outline,
                                      color: Colors.white,
                                      size: 24.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20.sp),
                        // Date Card
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.sp,
                            vertical: 12.sp,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12.sp),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildDateInfo(
                                icon: Icons.calendar_today,
                                title: 'امروز',
                                value: getCurrentDate(),
                              ),
                              buildDateInfo(
                                icon: Icons.access_time,
                                title: 'ساعت',
                                value: DateFormat(
                                  'HH:mm',
                                ).format(DateTime.now()),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Nutrition Progress Section
          Padding(
            padding: EdgeInsets.all(16.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'پیشرفت تغذیه امروز',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'irs',
                  ),
                ),
                SizedBox(height: 12.sp),
                Container(
                  padding: EdgeInsets.all(16.sp),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: getBorderRadiusFunc(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      buildNutritionProgress(
                        'پروتئین',
                        0.8,
                        324,
                        'G',
                        Colors.blueAccent,
                      ),
                      SizedBox(height: 12.sp),
                      buildNutritionProgress(
                        'کربوهیدرات',
                        0.4,
                        84,
                        'G',
                        Colors.orangeAccent,
                      ),
                      SizedBox(height: 12.sp),
                      buildNutritionProgress(
                        'چربی',
                        0.3,
                        30,
                        'G',
                        Colors.redAccent,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Quick Actions Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'دسترسی سریع',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'irs',
                  ),
                ),
                SizedBox(height: 12.sp),
                GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  childAspectRatio: 0.9,
                  mainAxisSpacing: 12.sp,
                  crossAxisSpacing: 12.sp,
                  children: [
                    buildQuickAction(
                      icon: Icons.favorite_border,
                      label: 'ضربان قلب',
                      color: Colors.redAccent,
                    ),
                    buildQuickAction(
                      icon: Icons.directions_walk,
                      label: 'قدم ها',
                      color: Colors.greenAccent,
                    ),
                    buildQuickAction(
                      icon: Icons.local_drink,
                      label: 'آب',
                      color: Colors.blueAccent,
                    ),
                    buildQuickAction(
                      icon: Icons.nightlight_round,
                      label: 'خواب',
                      color: Colors.purpleAccent,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Health Tips Section
          Padding(
            padding: EdgeInsets.all(16.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'نکات سلامتی',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'irs',
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'مشاهده همه',
                        style: TextStyle(
                          color: primaryColor,
                          fontFamily: 'irs',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.sp),
                Container(
                  height: 120.sp,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      buildHealthTipCard(
                        'نوشیدن آب کافی',
                        'روزانه 8 لیوان آب بنوشید',
                        Icons.local_drink,
                        Colors.lightBlue[100]!,
                      ),
                      SizedBox(width: 12.sp),
                      buildHealthTipCard(
                        'ورزش روزانه',
                        '30 دقیقه ورزش روزانه',
                        Icons.directions_run,
                        Colors.lightGreen[100]!,
                      ),
                      SizedBox(width: 12.sp),
                      buildHealthTipCard(
                        'خواب کافی',
                        '7-8 ساعت خواب شبانه',
                        Icons.bedtime,
                        Colors.deepPurple[100]!,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          FoodSectionContent(homeModel: widget.homeModel)
        ],
      ),
    );
  }
}
