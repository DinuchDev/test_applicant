import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeScreenController extends GetxController {
  //TODO: Implement ThemeScreenController
  final count = 0.obs;
  final isDarkMode = false.obs;
  final mainColor = Colors.white.obs;
  final iconColor = Colors.black.obs;

  void changeMode() {
    if (isDarkMode == true) {
      changeIntoLightMode();
    } else {
      changeIntoDarkMode();
    }
  }

  void changeIntoLightMode() {
    ThemeData.light();
    mainColor.value = Colors.white;
    iconColor.value = Colors.black;
    isDarkMode.value = false;
  }

  void changeIntoDarkMode() {
    ThemeData.dark();
    mainColor.value = Colors.black;
    iconColor.value = Colors.white;
    isDarkMode.value = true;
  }

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
