import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildQuickAction({
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

