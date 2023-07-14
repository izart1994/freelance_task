import 'package:flutter/material.dart';
import 'package:freelance_task/routes/route_helper.dart';
import 'package:freelance_task/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  String bgImageList = "assets/images/splash_screen_background.png";
  final PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                // color: kPrimary,
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage(bgImageList),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image(
                      image: const AssetImage('assets/images/person_1.png'),
                      height: 50.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                      child: BigText(
                        text: "Help Your Community",
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        size: 22.sp,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 3.h),
                      child: BigText(
                        text: "Make money by helping other fix their engineering issues",
                        color: Colors.white,
                        maxLines: 2,
                        size: 20.sp,
                        alignText: TextAlign.center,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getInitial());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blueAccent,
                        ),
                        child: const Icon(Icons.arrow_forward, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
