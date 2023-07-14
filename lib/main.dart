import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freelance_task/routes/route_helper.dart';
import 'package:freelance_task/helper/dependencies.dart' as dep;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'Freelance Task',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RouteHelper.getSplash(),
        getPages: RouteHelper.routes,
      );
    });
  }
}
