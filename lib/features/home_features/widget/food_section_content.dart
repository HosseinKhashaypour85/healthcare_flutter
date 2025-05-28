import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthcare_flutter/const/shape/border_radius.dart';
import 'package:healthcare_flutter/const/theme/colors.dart';
import 'package:healthcare_flutter/features/intro_features/widget/textstyle_widget.dart';
import 'package:healthcare_flutter/features/public_features/functions/number_generator/number_generator.dart';
import 'package:healthcare_flutter/features/public_features/functions/pre_values/pre_values.dart';
import 'package:healthcare_flutter/features/public_features/styles_widget/textstyle_style_widget.dart';

import '../../../const/shape/media_query.dart';
import '../model/home_model.dart';

class FoodSectionContent extends StatelessWidget {
  final HomeModel homeModel;

  const FoodSectionContent({super.key, required this.homeModel});

  @override
  Widget build(BuildContext context) {
    // final String generateFixedNum = numberGenerator();
    return GestureDetector(
      onTap: () {
        //   navigate to info screen
      },
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.sp,
          mainAxisSpacing: 10.sp,
          childAspectRatio: 1,
        ),
        itemCount: homeModel.items!.length,
        itemBuilder: (context, index) {
          final helper = homeModel.items![index];
          return Stack(
            children: [
              // تصویر اصلی
              Container(
                padding: EdgeInsets.all(8.sp),
                child: ClipRRect(
                  borderRadius: getBorderRadiusFunc(10),
                  child: FadeInImage(
                    placeholder: AssetImage(PreValues().image2Url),
                    image: NetworkImage(
                      helper.imageUrl!,
                    ),
                    width: getWidth(context, 0.4.sp),
                    height: getWidth(context, 0.4.sp),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 80.sp),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: getBorderRadiusFunc(10),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withOpacity(0.5),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),

              // محتوای بالای عکس (متن چپ + آیکون‌های راست)
              Positioned(
                top: 12.sp,
                left: 12.sp,
                right: 12.sp,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // متن در سمت چپ
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.sp,
                        vertical: 4.sp,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: getBorderRadiusFunc(20),
                      ),
                      child: Text(
                        helper.foodCalery! + 'KCAL',
                        // style: TextStyle(textStyle(10.sp, Colors.white)),
                        style: textStyle(fontSize: 10.sp, color: Colors.black),
                      ),
                    ),
                    // آیکون‌ها در سمت راست (کنار هم)
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4.sp),
                          decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.favorite_outline,
                            color: primaryColor,
                            size: 16.sp,
                          ),
                        ),
                        SizedBox(width: 6.sp), // فاصله بین آیکون‌ها
                        // آیکون ستاره
                        Container(
                          padding: EdgeInsets.all(4.sp),
                          margin: EdgeInsets.symmetric(horizontal: 4.sp),
                          decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.4),
                            shape: BoxShape.circle,
                          ),
                          child: GestureDetector(
                            /// Navigate to information screen;
                            onTap: () => print('object'),
                            child: Icon(
                              Icons.arrow_forward,
                              color: primaryColor,
                              size: 16.sp,
                            ),
                          ),
                        ),
                        Positioned.fill(
                          bottom: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: getBorderRadiusFunc(10),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.white.withOpacity(0.5),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
