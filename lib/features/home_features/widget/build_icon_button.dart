import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildIconButton({
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

