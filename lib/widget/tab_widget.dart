import 'package:connectify/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:connectify/view/home_view/home_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabWidget extends StatelessWidget {
  const TabWidget({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final BottomNavbarIconModel icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 40.w,
        margin: EdgeInsets.symmetric(horizontal: 2.w),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? AppColors.primary : AppColors.white,
        ),
        child: Center(
          child: Icon(
            isSelected ? icon.activeIcon : icon.inactiveIcon,
            color: isSelected ? AppColors.white : AppColors.grey,
          ),
        ),
      ),
    );
  }
}
