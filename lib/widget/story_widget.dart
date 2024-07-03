import 'package:connectify/common/app_colors.dart';
import 'package:connectify/common/assets.dart';
import 'package:connectify/common/text_styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70.sp,
          width: 70.sp,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.primary, width: 2),
          ),
          padding: EdgeInsets.all(1.sp),
          child: ClipOval(
            child: Image.asset(
              Assets.dummyUser2,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          name,
          style: TextStyling.regular.copyWith(fontSize: 12.sp),
        ),
      ],
    );
  }
}
