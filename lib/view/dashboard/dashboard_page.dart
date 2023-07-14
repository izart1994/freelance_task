import 'package:flutter/material.dart';
import 'package:freelance_task/controller/data_tasks_controller.dart';
import 'package:freelance_task/routes/route_helper.dart';
import 'package:freelance_task/utils/colors.dart';
import 'package:freelance_task/widgets/big_text.dart';
import 'package:freelance_task/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DashboardPage extends GetView<DataTasksController> {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgPrimaryColor,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 8.h)),
            // to ease finding, the parent will do like this. each of the class have its content
            topBarDashboardPage(), // create another class for top bar inside this page
            jobDoneDashboardPage(controller), // create another class for job done inside every card using horizontal scroll direction
            availableTaskDashboardPage(controller), // create another class for available task with cards as content
          ],
        ),
      ),
    );
  }

  Widget topBarDashboardPage() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(text: "Hi Mike,", color: AppColors.textWhiteColor, size: 18.sp),
              BigText(text: "Here is your weekly status,", color: AppColors.textGreyColor, size: 13.sp),
            ],
          ),
          const Icon(Icons.menu_rounded, color: AppColors.iconWhiteColor),
        ],
      ),
    );
  }

  Widget jobDoneDashboardPage(DataTasksController controller) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: controller.cardTitles.map((card) {
                return Container(
                  width: 50.w,
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Card(
                    color: card['color']!,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SmallText(text: card['name']!, size: 11.sp),
                          BigText(text: card['desc']!, color: AppColors.textWhiteColor, size: 22.sp, fontWeight: FontWeight.w600),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget availableTaskDashboardPage(DataTasksController controller) {
    return Stack(
      children: [
        Container(
          width: double.maxFinite,
          margin: EdgeInsets.only(top: 5.h),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(50), topLeft: Radius.circular(50)),
            color: AppColors.bgTertiaryColor,
          ),
          child: Container(
            height: 56.h,
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            margin: EdgeInsets.only(top: 3.h),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigText(text: "Available Tasks", size: 17.sp),
                      SmallText(text: "${controller.taskData.length} tasks", size: 15.sp),
                    ],
                  ),
                  Column(
                    children: controller.taskData
                        .map(
                          (index) => GestureDetector(
                            onTap: () {
                              Get.toNamed(RouteHelper.getTaskDetail(index['task_id']!));
                            },
                            child: Card(
                              margin: EdgeInsets.symmetric(vertical: 2.h),
                              child: Padding(
                                padding: EdgeInsets.all(5.w),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 2.h),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SmallText(
                                            text: '${index['priority']!} PRIORITY',
                                            size: 12.sp,
                                            color: index['priority']! == 'HIGH' ? AppColors.textOrangeColor : AppColors.textPurpleColor,
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                                            decoration: BoxDecoration(
                                              borderRadius: const BorderRadius.all(Radius.circular(2)),
                                              color: index['status']! == 'In Progress' ? AppColors.boxFifthColor : AppColors.boxFourthColor,
                                            ),
                                            child: SmallText(
                                              text: index['status']! == 'In Progress' ? 'NEW' : 'OLD',
                                              color: index['status']! == 'In Progress' ? AppColors.textGreenColor : AppColors.textRedColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 2.h),
                                      child: Text(
                                        index['desc']!,
                                        style: TextStyle(color: AppColors.textBlueColor, fontSize: 13.sp),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 15.sp,
                                              backgroundImage: AssetImage('assets/images/${index['pic_image']!}.png'),
                                            ),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(left: 2.w, right: 1.w),
                                                  child: SmallText(text: 'by', size: 12.sp),
                                                ),
                                                SmallText(text: index['pic']!, size: 14.sp, color: AppColors.textBlueColor),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SmallText(text: '${index['time']!} ago', size: 12.sp),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );

    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(top: 3.h),
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(50), topLeft: Radius.circular(50)),
        color: AppColors.bgTertiaryColor,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigText(text: "Available Tasks", size: 17.sp),
                SmallText(text: "${controller.taskData.length} tasks", size: 15.sp),
              ],
            ),
            Column(
              children: controller.taskData
                  .map(
                    (index) => GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getTaskDetail(index['task_id']!));
                      },
                      child: Card(
                        margin: EdgeInsets.symmetric(vertical: 2.h),
                        child: Padding(
                          padding: EdgeInsets.all(5.w),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 2.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SmallText(
                                      text: '${index['priority']!} PRIORITY',
                                      size: 12.sp,
                                      color: index['priority']! == 'HIGH' ? AppColors.textOrangeColor : AppColors.textPurpleColor,
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(Radius.circular(2)),
                                        color: index['status']! == 'In Progress' ? AppColors.boxFifthColor : AppColors.boxFourthColor,
                                      ),
                                      child: SmallText(
                                        text: index['status']! == 'In Progress' ? 'NEW' : 'OLD',
                                        color: index['status']! == 'In Progress' ? AppColors.textGreenColor : AppColors.textRedColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 2.h),
                                child: Text(
                                  index['desc']!,
                                  style: TextStyle(color: AppColors.textBlueColor, fontSize: 13.sp),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 15.sp,
                                        backgroundImage: AssetImage('assets/images/${index['pic_image']!}.png'),
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: 2.w, right: 1.w),
                                            child: SmallText(text: 'by', size: 12.sp),
                                          ),
                                          SmallText(text: index['pic']!, size: 14.sp, color: AppColors.textBlueColor),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SmallText(text: '${index['time']!} ago', size: 12.sp),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
