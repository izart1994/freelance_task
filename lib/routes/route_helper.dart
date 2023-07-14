import 'package:freelance_task/helper/const.dart';
import 'package:freelance_task/view/dashboard/detail_task_page.dart';
import 'package:freelance_task/view/home_page.dart';
import 'package:freelance_task/view/splash/splash_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RouteHelper {
  static const String splash = "/splash";
  static const String initial = "/";
  static const String taskDetail = "/taskDetail";

  static String getSplash() => splash;

  static String getInitial() => initial;

  static String getTaskDetail(int taskId) => "$taskDetail?taskId=$taskId";

  static List<GetPage> routes = [
    GetPage(
        name: splash,
        page: () {
          final GetStorage storage = GetStorage();
          final showLandingView = storage.read(StorageKeyName.showLandingView);
          if (showLandingView != null) {
            return const HomePage();
          } else {
            storage.write(StorageKeyName.showLandingView, 'true');
            return const SplashPage();
          }
        }),
    GetPage(name: initial, page: () => const HomePage(), transition: Transition.fade),
    GetPage(
        name: taskDetail,
        page: () {
          var taskId = Get.parameters['taskId'];
          return DetailTaskPage(taskId: int.parse(taskId!));
        },
        transition: Transition.fadeIn),
  ];
}
