import 'package:connectify/common/app_colors.dart';
import 'package:connectify/common/text_styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainButton extends StatelessWidget {
  final String buttonText;
  final Color buttonFontColor;
  final VoidCallback? onPressed;
  final bool fullWidth;
  final bool isLoading;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final double? fontSize;
  final Gradient? gradient;
  final BorderRadiusGeometry? borderRadius;
  final Widget? child;
  final Color? btnColor;

  const MainButton({
    Key? key,
    required this.buttonText,
    this.buttonFontColor = Colors.white,
    required this.onPressed,
    this.fullWidth = true,
    required this.isLoading,
    this.height,
    this.width,
    this.padding,
    this.fontSize,
    this.gradient,
    this.borderRadius,
    this.child,
    this.btnColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 60.h,
      width: fullWidth ? double.infinity : width,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(10.r),
        color: btnColor ?? AppColors.primary,
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(3),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(10.r),
            ),
          ),
          padding: MaterialStatePropertyAll(
            padding ?? EdgeInsets.symmetric(vertical: 10.h, horizontal: 24.w),
          ),
          visualDensity: VisualDensity.compact,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: isLoading
            ? Padding(
                padding: const EdgeInsets.all(4.0),
                child: Transform.scale(
                  scale: 0.6,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              )
            : child ??
                Text(
                  buttonText,
                  style: TextStyling.bold.copyWith(
                    fontSize: fontSize ?? 18.sp,
                    color: Colors.white,
                  ),
                ),
      ),
    );
  }
}
