import 'package:flutter/material.dart';
import 'package:freelance_task/utils/colors.dart';
import 'package:freelance_task/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({Key? key}) : super(key: key);

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
            contentProfile(),
          ],
        ),
      ),
    );
  }

  Widget topCenterText() {
    return Center(
      child: BigText(text: "MY PROFILE", color: AppColors.textWhiteColor, size: 16.sp),
    ).marginOnly(bottom: 4.h);
  }

  Widget contentProfile() {
    return Stack(
      children: [
        Container(
          width: double.maxFinite,
          margin: EdgeInsets.only(top: 6.h),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(50), topLeft: Radius.circular(50)),
            color: AppColors.bgTertiaryColor,
          ),
          child: Container(
            height: 75.h,
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  BigText(text: 'Mike Peter', size: 22.sp, fontWeight: FontWeight.w500).marginOnly(top: 10.h, bottom: 1.h),
                  BigText(text: 'mike@flexinstudio.com', size: 14.sp, color: AppColors.textGreyColor).marginOnly(bottom: 2.h),
                  TextFormField(
                    decoration: InputDecoration(
                      counterText: 'Name',
                      filled: true,
                      fillColor: AppColors.bgSecondaryColor,
                      hintText: 'Mike Peter',
                      hintStyle: const TextStyle(color: AppColors.textPrimaryColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ).marginOnly(bottom: 2.h),
                  TextFormField(
                    decoration: InputDecoration(
                      counterText: 'Email',
                      filled: true,
                      fillColor: AppColors.bgSecondaryColor,
                      hintText: 'mike@flexinstudio.com',
                      hintStyle: const TextStyle(color: AppColors.textPrimaryColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ).marginOnly(bottom: 2.h),
                  TextFormField(
                    decoration: InputDecoration(
                      counterText: 'Address',
                      filled: true,
                      fillColor: AppColors.bgSecondaryColor,
                      hintText: '46  St Andrews Lane, London, UK',
                      hintStyle: const TextStyle(color: AppColors.textPrimaryColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ).marginOnly(bottom: 2.h),
                  TextFormField(
                    decoration: InputDecoration(
                      counterText: 'Profession',
                      filled: true,
                      fillColor: AppColors.bgSecondaryColor,
                      hintText: 'Mechanical Engineer',
                      hintStyle: const TextStyle(color: AppColors.textPrimaryColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ).marginOnly(bottom: 2.h),
                ],
              ),
            ),
          ).marginOnly(top: 5.h),
        ),
        Center(
          child: CircleAvatar(
            radius: 40.sp,
            backgroundImage: const AssetImage('assets/images/image_3.png'),
          ),
        ),
      ],
    );
  }
}
