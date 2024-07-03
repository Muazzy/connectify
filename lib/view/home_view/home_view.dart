import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:connectify/common/app_colors.dart';
import 'package:connectify/common/text_styling.dart';
import 'package:connectify/widget/custom_textfield.dart';
import 'package:connectify/widget/home_app_bar.dart';
import 'package:connectify/widget/main_button.dart';
import 'package:connectify/widget/match_widget.dart';
import 'package:connectify/widget/my_story_widget.dart';
import 'package:connectify/widget/post_widget.dart';
import 'package:connectify/widget/story_widget.dart';
import 'package:connectify/widget/tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:connectify/view/home_view/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final postFutureProvider = FutureProvider(
    (ref) async => ref.watch(homeViewModelProvider).getAllPosts());

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final viewModel = ref.watch(homeViewModelProvider);
        final selectedTab = ref.watch(viewModel.indexBottomNavbarProvider);

        final posts = ref.watch(postFutureProvider);

        final postData = ref.watch(viewModel.postsProvider);

        return Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 40.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: const HomeAppBar(),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 24.w),
                        child: const MyStoryWidget(),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: SizedBox(
                          height: 100.h,
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                            separatorBuilder: (ctx, i) => SizedBox(width: 10.w),
                            itemBuilder: (ctx, i) =>
                                StoryWidget(name: viewModel.stories[i]),
                            shrinkWrap: true,
                            itemCount: viewModel.stories.length,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (selectedTab == 0 || selectedTab == 1 || selectedTab == 4)
                    Container(
                      child: posts.when(
                        data: (d) => Expanded(
                          child: ListView.separated(
                            padding: EdgeInsets.symmetric(
                              horizontal: 24.w,
                              vertical: 20.h,
                            ),
                            separatorBuilder: (context, index) => SizedBox(
                              height: 10.h,
                            ),
                            itemBuilder: (ctx, i) {
                              final post = postData[i];

                              return PostWidget(post: post);
                            },
                            itemCount: postData.length,
                            shrinkWrap: true,
                          ),
                        ),
                        error: (error, stackTrace) => ErrorWidget(error),
                        loading: () => Expanded(
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primary,
                              strokeWidth: 3.w,
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (selectedTab == 3)
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Your Matches ${viewModel.stories.length}',
                              style: TextStyling.semiBold.copyWith(
                                fontSize: 24.sp,
                              ),
                            ),
                            Expanded(
                              child: AutoHeightGridView(
                                itemCount: viewModel.stories.length,
                                shrinkWrap: true,
                                builder: (ctx, i) => MatchWidget(
                                  name: viewModel.stories[i],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(
                    left: 24.w,
                    right: 24.w,
                    bottom: 24.w,
                  ),
                  padding: EdgeInsets.all(10.sp),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.primary.withOpacity(0.1),
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: viewModel.bottomNavbarIcons
                        .asMap()
                        .entries
                        .map(
                          (e) => TabWidget(
                            onTap: () {
                              if (e.key == 2) {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      Consumer(builder: (context, ref, child) {
                                    return Dialog(
                                      backgroundColor: AppColors.white,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                        ),
                                        padding: EdgeInsets.all(20.sp),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Add new post',
                                              style: TextStyling.medium,
                                            ),
                                            SizedBox(height: 20.h),
                                            CustomTextfield(
                                              controller:
                                                  viewModel.titleController,
                                              hintText: 'Title',
                                            ),
                                            SizedBox(height: 20.h),
                                            SizedBox(
                                              height: 200.h,
                                              child: CustomTextfield(
                                                maxLines: 5,
                                                controller:
                                                    viewModel.contentController,
                                                hintText: 'Content',
                                              ),
                                            ),
                                            MainButton(
                                              width: 200.w,
                                              buttonText: 'Add',
                                              onPressed: () async {
                                                final result = await viewModel
                                                    .insertPost()
                                                    .whenComplete(() {
                                                  Navigator.pop(context);
                                                });
                                                print(
                                                    'result is: ${result?.body}');
                                                if (result != null) {}
                                              },
                                              isLoading: false,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                                );
                              } else {
                                ref
                                    .read(viewModel
                                        .indexBottomNavbarProvider.notifier)
                                    .update(
                                      (state) => e.key,
                                    );
                              }
                            },
                            icon: e.value,
                            isSelected:
                                e.key == 2 ? false : e.key == selectedTab,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
