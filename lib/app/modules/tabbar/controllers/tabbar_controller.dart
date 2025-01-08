import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../nav_controller/bottom_nav_controller.dart';


class TabbarController extends GetxController {
  //TODO: Implement TabbarController

  final count = 0.obs;
  var tabIndex = 0.obs;
  GlobalKey globalKey = GlobalKey(debugLabel: 'btm_app_bar');
  BottomNavigationController bottomNavigationController =
  Get.put(BottomNavigationController());

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
