import 'package:connectify/common/app_colors.dart';
import 'package:connectify/common/assets.dart';
import 'package:connectify/common/text_styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyStoryWidget extends StatelessWidget {
  const MyStoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 70.sp,
              width: 70.sp,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                Assets.dummyUser1,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                height: 20.sp,
                width: 20.sp,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                  border: Border.all(color: AppColors.white, width: 2),
                ),
                child: Icon(
                  Icons.add,
                  color: AppColors.white,
                  size: 12.sp,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 5.h),
        Text(
          "My Story",
          style: TextStyling.regular.copyWith(fontSize: 12.sp),
        ),
      ],
    );
  }
}
