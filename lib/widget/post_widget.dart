import 'package:connectify/common/app_colors.dart';
import 'package:connectify/common/assets.dart';
import 'package:connectify/common/text_styling.dart';
import 'package:connectify/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    super.key,
    required this.post,
  });

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(
              0.5,
            ),
            BlendMode.overlay,
          ),
          image: AssetImage(
            Assets.dummyPostImage,
          ),
        ),
      ),
      // padding: EdgeInsets.all(12.sp),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.3),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  bottomLeft: Radius.circular(16.r),
                ),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 5.h,
                horizontal: 10.w,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(10.sp),
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.thumb_up,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    padding: EdgeInsets.all(10.sp),
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.message,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    padding: EdgeInsets.all(10.sp),
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.more_horiz,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 10.w,
            top: 10.h,
            child: Container(
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
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: AppColors.white,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    'Post id: ${post.id ?? ""}',
                    style: TextStyling.semiBold.copyWith(
                      fontSize: 12.sp,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  post.title ?? "",
                  style: TextStyling.regular.copyWith(
                    color: AppColors.white,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Container(
                      height: 30.sp,
                      width: 30.sp,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          Assets.dummyUser2,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Miranda Kehlani',
                          style: TextStyling.thin.copyWith(
                            color: AppColors.white,
                            fontSize: 10.sp,
                          ),
                        ),
                        Text(
                          'STREAMER',
                          style: TextStyling.thin.copyWith(
                            color: AppColors.grey,
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
