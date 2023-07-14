import 'package:flutter/material.dart';
import 'package:freelance_task/controller/overview_ui_controller.dart';
import 'package:freelance_task/utils/colors.dart';
import 'package:freelance_task/view/dashboard/dashboard_page.dart';
import 'package:freelance_task/view/transaction/trans_history_page.dart';
import 'package:freelance_task/view/userinfo/user_info_page.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: Get.find<OverviewUIController>().selectedTab);
  }

  List<Widget> _buildScreens() {
    return [
      const DashboardPage(),
      const TransHistoryPage(),
      const UserInfoPage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_rounded),
        // title: ("Home"),
        activeColorPrimary: AppColors.activeIconBottomColor,
        inactiveColorPrimary: AppColors.inActiveIconBottomColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.bubble_chart_outlined),
        // title: ("Alarm"),
        activeColorPrimary: AppColors.activeIconBottomColor,
        inactiveColorPrimary: AppColors.inActiveIconBottomColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        // title: ("Info"),
        activeColorPrimary: AppColors.activeIconBottomColor,
        inactiveColorPrimary: AppColors.inActiveIconBottomColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false; // Prevent navigating back
      },
      child: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style11,
        // Choose the nav bar style with this property.
      ),
    );
  }
}
