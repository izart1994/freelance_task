import 'package:get/get.dart';

class OverviewUIController extends GetxController {
  int selectedTab = 0;

  void selectTab(int selectTab) {
    selectedTab = selectTab;
    refresh();
  }
}
