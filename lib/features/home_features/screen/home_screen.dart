import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthcare_flutter/const/shape/border_radius.dart';
import 'package:healthcare_flutter/const/theme/colors.dart';
import 'package:healthcare_flutter/features/home_features/widget/Icons_row_widget.dart';
import 'package:healthcare_flutter/features/home_features/widget/progress_bar_widget.dart';
import 'package:healthcare_flutter/features/intro_features/widget/textstyle_widget.dart';
import 'package:intl/intl.dart';
import 'package:shamsi_date/shamsi_date.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String screenId = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String getCurrentDate() {
    final now = DateTime.now();
    final jalaali = now.toJalali();
    return '${jalaali.year}/${jalaali.month.toString().padLeft(2, '0')}/${jalaali.day.toString().padLeft(2, '0')}';
  }

  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'صبح بخیر';
    } else if (hour < 17) {
      return 'ظهر بخیر';
    } else {
      return 'عصر بخیر';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _floatingActionButtonFunc(),
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
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
                                _buildIconButton(
                                  icon: Icons.menu,
                                  onPressed: () {},
                                ),
                                SizedBox(width: 8.sp),
                                _buildIconButton(
                                  icon: Icons.notifications_active_outlined,
                                  onPressed: () {},
                                  showBadge: true,
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
                              _buildDateInfo(
                                icon: Icons.calendar_today,
                                title: 'امروز',
                                value: getCurrentDate(),
                              ),
                              _buildDateInfo(
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
                        _buildNutritionProgress(
                          'پروتئین',
                          0.8,
                          324,
                          'G',
                          Colors.blueAccent,
                        ),
                        SizedBox(height: 12.sp),
                        _buildNutritionProgress(
                          'کربوهیدرات',
                          0.4,
                          84,
                          'G',
                          Colors.orangeAccent,
                        ),
                        SizedBox(height: 12.sp),
                        _buildNutritionProgress(
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
                      _buildQuickAction(
                        icon: Icons.favorite_border,
                        label: 'ضربان قلب',
                        color: Colors.redAccent,
                      ),
                      _buildQuickAction(
                        icon: Icons.directions_walk,
                        label: 'قدم ها',
                        color: Colors.greenAccent,
                      ),
                      _buildQuickAction(
                        icon: Icons.local_drink,
                        label: 'آب',
                        color: Colors.blueAccent,
                      ),
                      _buildQuickAction(
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
                        _buildHealthTipCard(
                          'نوشیدن آب کافی',
                          'روزانه 8 لیوان آب بنوشید',
                          Icons.local_drink,
                          Colors.lightBlue[100]!,
                        ),
                        SizedBox(width: 12.sp),
                        _buildHealthTipCard(
                          'ورزش روزانه',
                          '30 دقیقه ورزش روزانه',
                          Icons.directions_run,
                          Colors.lightGreen[100]!,
                        ),
                        SizedBox(width: 12.sp),
                        _buildHealthTipCard(
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
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onPressed,
    bool showBadge = false,
  }) {
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon, color: Colors.white, size: 24.sp),
        ),
        if (showBadge)
          Positioned(
            right: 8.sp,
            top: 8.sp,
            child: Container(
              width: 8.sp,
              height: 8.sp,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildDateInfo({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 18.sp),
        SizedBox(width: 8.sp),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 12.sp,
                fontFamily: 'irs',
              ),
            ),
            Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'irs',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNutritionProgress(
    String title,
    double progress,
    int value,
    String unit,
    Color color,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'irs',
              ),
            ),
            Text(
              '$value $unit',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey,
                fontFamily: 'irs',
              ),
            ),
          ],
        ),
        SizedBox(height: 8.sp),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.grey[200],
          color: color,
          minHeight: 8.sp,
          borderRadius: BorderRadius.circular(4.sp),
        ),
        SizedBox(height: 4.sp),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '${(progress * 100).toInt()}% از هدف روزانه',
            style: TextStyle(
              fontSize: 10.sp,
              color: Colors.grey,
              fontFamily: 'irs',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickAction({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Column(
      children: [
        Container(
          width: 48.sp,
          height: 48.sp,
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 24.sp),
        ),
        SizedBox(height: 8.sp),
        Text(label, style: TextStyle(fontSize: 12.sp, fontFamily: 'irs')),
      ],
    );
  }

  Widget _buildHealthTipCard(
    String title,
    String description,
    IconData icon,
    Color color,
  ) {
    return Container(
      width: 160.sp,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.sp),
      ),
      padding: EdgeInsets.all(12.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 28.sp, color: Colors.black54),
          SizedBox(height: 8.sp),
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              fontFamily: 'irs',
            ),
          ),
          SizedBox(height: 4.sp),
          Text(
            description,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.black54,
              fontFamily: 'irs',
            ),
          ),
        ],
      ),
    );
  }
}

Widget _floatingActionButtonFunc() {
  return FloatingActionButton(
    backgroundColor: linkColor,
    onPressed: () {},
    child: Icon(Icons.chat, color: Colors.white),
  );
}
