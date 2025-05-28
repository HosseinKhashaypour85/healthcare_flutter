import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthcare_flutter/const/shape/border_radius.dart';
import 'package:healthcare_flutter/const/shape/media_query.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmerLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // برای اسکرول کردن همه محتوا
      child: Column(
        children: [
          // شیمر اول (با ClipPath)
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Container(height: 220.sp, color: Colors.white),
            ),
          ),

          // شیمر با استفاده از Row
          Row(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: getBorderRadiusFunc(10),
                  ),
                  margin: EdgeInsets.all(10.sp),
                  height: getHeight(context, 0.04.sp),
                  width: getWidth(context, 0.3.sp),
                ),
              ),
            ],
          ),

          // شیمر دیگر
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: getBorderRadiusFunc(10),
              ),
              margin: EdgeInsets.all(10.sp),
              height: 200.sp,
            ),
          ),

          // شیمر دایره‌ها (با Row)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(4, (index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  margin: EdgeInsets.all(10.sp),
                  height: getHeight(context, 0.2.sp),
                  width: getWidth(context, 0.1.sp),
                ),
              );
            }),
          ),

          // شیمر دیگر
          Row(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: getBorderRadiusFunc(10),
                  ),
                  margin: EdgeInsets.all(10.sp),
                  height: getHeight(context, 0.04.sp),
                  width: getWidth(context, 0.3.sp),
                ),
              ),
            ],
          ),
          Container(
            height: 300.sp, // محدود کردن ارتفاع برای ListView
            child: ListView.builder(
              shrinkWrap: true, // برای محدود کردن ارتفاع داخل ListView
              itemCount: 4,
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.all(10.sp),
                    height: 60, // ارتفاع ثابت برای تست
                    width: 150, // عرض ثابت برای تست
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
