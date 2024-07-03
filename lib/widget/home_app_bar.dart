import 'package:connectify/common/app_colors.dart';
import 'package:connectify/common/text_styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Friendzy',
          style: TextStyling.semiBold.copyWith(fontSize: 24.sp),
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white,
            border: Border.all(
              color: AppColors.grey,
            ),
          ),
          padding: EdgeInsets.all(5.h),
          child: Icon(
            Icons.notifications_outlined,
            color: AppColors.primary,
            size: 24.sp,
          ),
        ),
      ],
    );
  }
}
