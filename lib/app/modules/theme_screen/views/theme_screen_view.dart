import 'package:buddhismapp/app/widgets/icon_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/theme_screen_controller.dart';

class ThemeScreenView extends GetView<ThemeScreenController> {
  const ThemeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: controller.mainColor.value,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            ),
          ),
          title: ContentText(
            title: 'ផ្ទៃបង្ហាញ',
            color: Colors.grey.withOpacity(1), fontWeight: FontWeight.w500,
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: InkWell(
                onTap: () {
                  controller.changeIntoLightMode();
                },
                child: SizedBox(
                  // color: Colors.white10,
                  height: 100,
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/appearance.svg',
                          color: Colors.grey.withOpacity(1),
                        ),
                        const SizedBox(width: 16),
                        // Add spacing between SVG and text
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "រចនាបទឧបករណ៍",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 22,
                                  fontFamily: 'Inter',
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                "រចនាបទនេះភ្លឺល្អសំរាប់ការប្រើប្រាស់ពេលថ្ងៃ "
                                "ឬនៅកន្លែងដែលមានពន្លឺច្បាស់គ្រប់គ្រាន់",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                // Ensure text doesn't overflow
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: InkWell(
                onTap: () {
                  controller.changeIntoDarkMode();
                },
                child: SizedBox(
                  // color: Colors.white10,
                  height: 100,
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/sun.svg',
                          color: Colors.grey.withOpacity(1),
                        ),
                        const SizedBox(width: 16),
                        // Add spacing between SVG and text
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "រចនាបទឧបករណ៍",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 22,
                                  fontFamily: 'Inter',
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                "រចនាបទនេះភ្លឺល្អសំរាប់ការប្រើប្រាស់ពេលថ្ងៃ "
                                "ឬនៅកន្លែងដែលមានពន្លឺច្បាស់គ្រប់គ្រាន់",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                // Ensure text doesn't overflow
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: InkWell(
                onTap: () {
                  controller.changeIntoDarkMode();
                },
                child: SizedBox(
                  // color: Colors.white10,
                  height: 100,
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/moon.svg',
                          color: Colors.grey.withOpacity(1),
                        ),
                        const SizedBox(width: 16),
                        // Add spacing between SVG and text
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "រចនាបទឧបករណ៍",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 22,
                                  fontFamily: 'Inter',
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                "រចនាបទនេះភ្លឺល្អសំរាប់ការប្រើប្រាស់ពេលថ្ងៃ "
                                "ឬនៅកន្លែងដែលមានពន្លឺច្បាស់គ្រប់គ្រាន់",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                // Ensure text doesn't overflow
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
