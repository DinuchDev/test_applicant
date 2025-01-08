import 'package:get/get.dart';

import '../controllers/theme_screen_controller.dart';

class ThemeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThemeScreenController>(
      () => ThemeScreenController(),
    );
  }
  // void dependencies() {
  //   Get.lazyPut<ThemeScreenController>(() => ThemeScreenController());
  // }
}
