import 'package:connectify/common/app_colors.dart';
import 'package:connectify/common/assets.dart';
import 'package:connectify/common/text_styling.dart';
import 'package:connectify/view/login/login_view_model.dart';
import 'package:connectify/widget/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final viewModel = ref.read(loginViewModelProvider);
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(height: 60.h),
                Expanded(
                  child: Image.asset(
                    Assets.loginHero,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Let's meet new people arond you",
                  style: TextStyling.bold.copyWith(
                    fontSize: 40.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 100.h),
                MainButton(
                  fullWidth: false,

                  buttonText: 'Login with phone',
                  onPressed: () {
                    viewModel.onClickLogin(context);
                  },
                  isLoading: false,
                  width: MediaQuery.of(context).size.width - 48.w,
                  // padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
                  // height: 65.w,
                  borderRadius: BorderRadius.circular(30.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white,
                        ),
                        padding: EdgeInsets.all(
                          10.h,
                        ),
                        child: Icon(
                          Icons.phone_outlined,
                          color: AppColors.primary,
                          size: 20.sp,
                        ),
                      ),
                      Text(
                        'Login with phone',
                        textAlign: TextAlign.center,
                        style:
                            TextStyling.medium.copyWith(color: AppColors.white),
                      ),
                      SizedBox(width: 30.w),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                MainButton(
                  fullWidth: false,
                  buttonText: 'Login with google',
                  width: MediaQuery.of(context).size.width - 48.w,
                  onPressed: () {
                    viewModel.onClickLogin(context);
                  },
                  isLoading: false,
                  // padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
                  // height: 65.w,
                  btnColor: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white,
                        ),
                        padding: EdgeInsets.all(
                          10.h,
                        ),
                        child: Icon(
                          Icons.circle,
                          color: AppColors.primary,
                          size: 20.sp,
                        ),
                      ),
                      Text(
                        'Login with google',
                        textAlign: TextAlign.center,
                        style: TextStyling.medium.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(width: 30.w),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyling.thin.copyWith(color: AppColors.grey),
                    ),
                    SizedBox(width: 5.w),
                    GestureDetector(
                      onTap: () {
                        viewModel.onClickLogin(context);
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyling.semiBold.copyWith(
                            color: AppColors.primary, fontSize: 14.sp),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
