import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildHealthTipCard(
    String title,
    String description,
    IconData icon,
    Color color,
    ) {
  // متغیرهای حالت انیمیشن
  final isTapped = ValueNotifier<bool>(false);
  final isSuccess = ValueNotifier<bool>(false);

  return GestureDetector(
    onTapDown: (_) => isTapped.value = true,
    onTapUp: (_) {
      isTapped.value = false;
      isSuccess.value = true;
      Future.delayed(Duration(milliseconds: 1500), () => isSuccess.value = false);
    },
    onTapCancel: () => isTapped.value = false,
    child: ValueListenableBuilder<bool>(
      valueListenable: isTapped,
      builder: (context, tapped, _) {
        return ValueListenableBuilder<bool>(
          valueListenable: isSuccess,
          builder: (context, success, _) {
            return Stack(
              children: [
                // کارت اصلی با انیمیشن تغییر رنگ و scale
                AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  transform: Matrix4.identity()
                    ..scale(tapped ? 0.95 : 1.0), // افکت فشرده شدن هنگام کلیک
                  width: 160.sp,
                  decoration: BoxDecoration(
                    color: success ? color.withOpacity(0.7) : color,
                    borderRadius: BorderRadius.circular(12.sp),
                  ),
                  padding: EdgeInsets.all(12.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        icon,
                        size: 28.sp,
                        color: success ? Colors.white : Colors.black54,
                      ),
                      SizedBox(height: 8.sp),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'irs',
                          color: success ? Colors.white : Colors.black,
                        ),
                      ),
                      SizedBox(height: 4.sp),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: success ? Colors.white70 : Colors.black54,
                          fontFamily: 'irs',
                        ),
                      ),
                    ],
                  ),
                ),

                // افکت موفقیت (AnimatedIcon)
                if (success)
                  Positioned.fill(
                    child: Center(
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: success ? 1 : 0,
                        child: Container(
                          padding: EdgeInsets.all(8.sp),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.9),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.check,
                            size: 32.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        );
      },
    ),
  );
}