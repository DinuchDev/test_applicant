import 'package:buddhismapp/app/modules/theme_screen/controllers/theme_screen_controller.dart';
import 'package:buddhismapp/app/modules/theme_screen/views/theme_screen_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/modules/tabbar/views/tabbar_view.dart';
import 'app/routes/app_pages.dart';

void main() {
  // runApp(
  //   GetMaterialApp(
  //     title: "Application",
  //     initialRoute: AppPages.INITIAL,
  //     getPages: AppPages.routes,
  //   ),
  // );
  runApp(MyApp() as Widget);
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeScreenController themeScreenController =
      Get.put(ThemeScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        title: "Applicant Test",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: themeScreenController.isDarkMode.value
            ? ThemeData.dark()
            : ThemeData.light(),
      );
    });
  }
}
