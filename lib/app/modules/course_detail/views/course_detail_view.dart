import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/course_detail_controller.dart';

class CourseDetailView extends GetView<CourseDetailController> {
  const CourseDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
            SvgPicture.asset('assets/svg/wishlist.svg'),
          ],
        ),
      ),
      body: Column(
        children: [
          // Video Section
          Obx(() => controller.currentVideoUrl.value.isEmpty
              ? Container(
                  height: 200,
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      "Select a video to play",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              : YoutubePlayerWidget(controller.currentVideoUrl.value)),

          // Tabs Section
          TabBarSection(controller: controller),

          // Tab Content
          Obx(() {
            switch (controller.selectedTabIndex.value) {
              case 0:
                return LessonTab(controller: controller);
              case 1:
                return AboutCourseTab();
              case 2:
                return QnATab();
              default:
                return SizedBox.shrink();
            }
          }),
        ],
      ),
    );
  }
}
