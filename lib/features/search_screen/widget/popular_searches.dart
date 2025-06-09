import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../public_features/styles_widget/textstyle_style_widget.dart';

class PopularSearches extends StatelessWidget {
  const PopularSearches({super.key});

  @override
  Widget build(BuildContext context) {
    return   Expanded(
      child: ListView(
        children: [
          _buildPopularSearchItem('برنامه ورزشی هفتگی', Icons.fitness_center),
          _buildPopularSearchItem('مربی شخصی', Icons.person),
          _buildPopularSearchItem('رژیم غذایی سالم', Icons.restaurant),
          _buildPopularSearchItem('تمرینات کاهش وزن', Icons.monitor_weight),
          _buildPopularSearchItem('یوگا برای مبتدیان', Icons.self_improvement),
        ],
      ),
    );
  }
}
Widget _buildPopularSearchItem(String title, IconData icon) {
  return ListTile(
    leading: Icon(icon, color: Colors.blue[800], size: 24.sp),
    title: Text(
      title,
      style: textStyle(fontSize: 14.sp, color: Colors.black),
    ),
    trailing: Icon(Icons.arrow_forward_ios, size: 16.sp, color: Colors.grey),
    onTap: () {
      // Handle popular search item tap
    },
  );
}