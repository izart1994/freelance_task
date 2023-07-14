import 'package:flutter/material.dart';
import 'package:freelance_task/controller/data_tasks_controller.dart';
import 'package:freelance_task/utils/colors.dart';
import 'package:freelance_task/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DetailTaskPage extends StatelessWidget {
  final int taskId;
  DetailTaskPage({Key? key, required this.taskId}) : super(key: key);

  final DataTasksController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> dataTask = Get.find<DataTasksController>().taskData.elementAt(taskId - 1);
    return Scaffold(
      body: Stack(
        children: [
          backgroundImageOne(),
          backgroundImageTwo(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              contentExpanded(),
              contentInsideCard(dataTask),
            ],
          ),
        ],
      ),
    );
  }

  Widget backgroundImageOne() {
    return Image.asset(
      'assets/images/background_image.png',
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }

  Widget backgroundImageTwo() {
    return Image.asset(
      'assets/images/three_boxes.png',
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }

  Widget contentExpanded() {
    return Expanded(
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
        child: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const CircleAvatar(
            backgroundColor: AppColors.boxFirstColor,
            child: Icon(Icons.arrow_back_rounded),
          ),
        ),
      ),
    );
  }

  Widget contentInsideCard(Map<String, dynamic> dataTask) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
      padding: EdgeInsets.only(top: 2.h),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: AppColors.bgPrimaryColor,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmallText(
                  text: 'Assigned To: ',
                  size: 12.sp,
                ),
                SmallText(text: dataTask['pic'], size: 12.sp, fontWeight: FontWeight.w600),
              ],
            ),
          ),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(top: 2.h),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: AppColors.bgSecondaryColor,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 2.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 7.w,
                            backgroundColor: AppColors.circleFirstColor,
                            child: const Icon(
                              Icons.warning_amber_rounded,
                              color: AppColors.textOrangeColor,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 1.h),
                            child: SmallText(text: 'SEVERITY', size: 12.sp),
                          ),
                          SmallText(
                            text: dataTask['priority'],
                            size: 12.sp,
                            color: dataTask['priority'] == 'HIGH' ? AppColors.textRedColor : AppColors.textOrangeColor,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 7.w,
                            backgroundColor: AppColors.circleSecondColor,
                            child: const Icon(
                              Icons.cable_rounded,
                              color: AppColors.textPurpleColor,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 1.h),
                            child: SmallText(text: 'STATUS', size: 12.sp),
                          ),
                          SmallText(text: dataTask['status'], size: 12.sp, color: AppColors.bgPrimaryColor),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 7.w,
                            backgroundColor: AppColors.circleThirdColor,
                            child: const Icon(
                              Icons.device_hub_rounded,
                              color: AppColors.textEleBlueColor,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 1.h),
                            child: SmallText(text: 'DEVICE', size: 12.sp),
                          ),
                          SmallText(text: dataTask['device'], size: 12.sp, color: AppColors.bgPrimaryColor),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                  child: const Divider(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
                  child: Column(
                    children: [
                      SmallText(text: 'REPORTED PROBLEM', size: 13.sp),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        child: Text(
                          dataTask['desc'],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 13.sp, height: 1.5, color: AppColors.bgPrimaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 1.5.h),
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(AppColors.boxFirstColor),
                      textStyle: MaterialStateProperty.all<TextStyle>(
                        TextStyle(fontSize: 12.sp),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 2.h)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Mark As Done',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
