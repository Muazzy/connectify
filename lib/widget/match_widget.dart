import 'package:connectify/common/app_colors.dart';
import 'package:connectify/common/assets.dart';
import 'package:connectify/common/text_styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MatchWidget extends StatelessWidget {
  const MatchWidget({
    super.key,
    required this.name,
  });

  final String name;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(Assets.dummyUser2),
            ),
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              color: AppColors.primary.withOpacity(1),
              width: 4,
            ),
          ),
          padding: EdgeInsets.all(10.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.6),
                    border: Border.all(
                      color: AppColors.white.withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(10.r)),
                padding: EdgeInsets.symmetric(
                  horizontal: 10.sp,
                  vertical: 2.sp,
                ),
                child: Text(
                  '2.5 km away',
                  style: TextStyling.semiBold.copyWith(
                    fontSize: 12.sp,
                    color: AppColors.white,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                '$name, 20',
                style: TextStyling.bold.copyWith(
                  fontSize: 12.sp,
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                '$name, 20',
                style: TextStyling.bold.copyWith(
                  fontSize: 10.sp,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10.r),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 10.sp,
              vertical: 2.sp,
            ),
            child: Text(
              '2.5 km away',
              style: TextStyling.semiBold.copyWith(
                fontSize: 12.sp,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
