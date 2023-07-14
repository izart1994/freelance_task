import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:freelance_task/controller/data_tasks_controller.dart';
import 'package:freelance_task/routes/route_helper.dart';
import 'package:freelance_task/utils/colors.dart';
import 'package:freelance_task/widgets/big_text.dart';
import 'package:freelance_task/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class TransHistoryPage extends GetView<DataTasksController> {
  const TransHistoryPage({Key? key}) : super(key: key);

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
            topCenterText(),
            contentTransHistory(),
          ],
        ),
      ),
    );
  }

  Widget topCenterText() {
    return Center(
      child: BigText(text: "TRANSACTION HISTORY", color: AppColors.textWhiteColor, size: 16.sp),
    ).marginOnly(bottom: 4.h);
  }

  Widget contentTransHistory() {
    final GlobalKey<AnimatedCircularChartState> chartKey = GlobalKey<AnimatedCircularChartState>();

    return Stack(
      children: [
        Container(
          width: double.maxFinite,
          margin: EdgeInsets.only(top: 20.h),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(50), topLeft: Radius.circular(50)),
            color: AppColors.bgTertiaryColor,
          ),
          child: Container(
            height: 54.h,
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: AppColors.boxFirstColor,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SmallText(text: 'Total Money Earned').paddingOnly(bottom: 0.5.h),
                              BigText(
                                text: '\$824.00',
                                size: 22.sp,
                                color: AppColors.textWhiteColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                          AnimatedCircularChart(
                            key: chartKey,
                            holeLabel: '76%',
                            holeRadius: 20,
                            labelStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                            size: Size(20.w, 20.w),
                            initialChartData: <CircularStackEntry>[
                              CircularStackEntry(
                                <CircularSegmentEntry>[
                                  const CircularSegmentEntry(
                                    76,
                                    Colors.white,
                                    rankKey: 'completed',
                                  ),
                                  CircularSegmentEntry(
                                    24,
                                    Colors.blueGrey[600],
                                    rankKey: 'remaining',
                                  ),
                                ],
                                rankKey: 'progress',
                              ),
                            ],
                            chartType: CircularChartType.Radial,
                            edgeStyle: SegmentEdgeStyle.round,
                            percentageValues: true,
                          ),
                        ],
                      ),
                    ),
                  ).paddingOnly(top: 20.h, bottom: 3.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigText(text: 'Work History', size: 16.sp, fontWeight: FontWeight.w600),
                      SmallText(text: '${controller.taskData.length - 2} tasks', size: 14.sp),
                    ],
                  ).paddingOnly(bottom: 2.h),
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
          ).marginOnly(top: 5.h),
        ),
        Center(
          child: Container(
            width: double.maxFinite,
            margin: EdgeInsets.symmetric(horizontal: 7.w),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: AppColors.bgSecondaryColor,
            ),
            child: Column(
              children: [
                BigText(
                  text: "TRANSACTION HISTORY",
                  color: AppColors.textPrimaryColor,
                  size: 16.sp,
                  fontWeight: FontWeight.w600,
                ).marginOnly(bottom: 1.h, top: 2.h),
                SmallText(
                  text: "20 Apr - 27 Apr",
                  color: AppColors.textGreyColor,
                  size: 12.sp,
                ).marginOnly(bottom: 1.h),
                Obx(
                  () => AnimatedButtonBar(
                    radius: 32.0,
                    backgroundColor: AppColors.boxSixthColor,
                    foregroundColor: AppColors.boxFirstColor,
                    elevation: 24,
                    innerVerticalPadding: 10,
                    children: [
                      ButtonBarEntry(
                          onTap: () {
                            controller.clickedHistoryBtn(0);
                          },
                          child: SmallText(text: 'Weekly', color: controller.selectedHistoryBtn.value == 0 ? Colors.white : Colors.grey)),
                      ButtonBarEntry(
                          onTap: () {
                            controller.clickedHistoryBtn(1);
                          },
                          child: SmallText(text: 'Monthly', color: controller.selectedHistoryBtn.value == 1 ? Colors.white : Colors.grey)),
                      ButtonBarEntry(
                          onTap: () {
                            controller.clickedHistoryBtn(2);
                          },
                          child: SmallText(text: 'All Day', color: controller.selectedHistoryBtn.value == 2 ? Colors.white : Colors.grey)),
                    ],
                  ).marginOnly(right: 5.w, left: 5.w, bottom: 2.h),
                ),
                SizedBox(
                  height: 25.h,
                  width: 50.w,
                  child: Obx(
                    () => BarChart(
                      controller.sampleData(),
                      swapAnimationDuration: const Duration(milliseconds: 500),
                    ),
                  ),
                ).paddingOnly(bottom: 1.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
