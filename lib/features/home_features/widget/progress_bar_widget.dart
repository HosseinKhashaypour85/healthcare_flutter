import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildNutritionProgress(
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
