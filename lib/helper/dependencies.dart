import 'package:freelance_task/controller/data_tasks_controller.dart';
import 'package:freelance_task/controller/overview_ui_controller.dart';
import 'package:get/get.dart';

Future<void> init() async {
  // controller
  Get.lazyPut(() => OverviewUIController());
  Get.lazyPut(() => DataTasksController());
}
