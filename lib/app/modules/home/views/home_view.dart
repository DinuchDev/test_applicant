import 'package:buddhismapp/app/widgets/icon_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/logo.png',
              fit: BoxFit.contain), // Replace with your logo
        ),
        centerTitle: false,
        title: Obx(() {
          // Use Obx to observe changes in controller's search visibility
          return controller.isSearchVisible.value
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Flexible(
                        child: TextField(
                          autofocus: true, // Automatically focus when visible
                          style: TextStyle(color: Colors.white), // Text color
                          decoration: InputDecoration(
                            hintText: "Search...",
                            hintStyle: TextStyle(color: Colors.white70),
                            border: InputBorder.none,
                            filled: false,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox();
        }),
        actions: [
          IconButton(
            onPressed: () {
              // Toggle search visibility
              controller.isSearchVisible.value =
                  !controller.isSearchVisible.value;
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: Stack(
                children: [
                  Column(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          enableInfiniteScroll: true,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 1000 * 3),
                          // autoPlayCurve: Curves.fastOutSlowIn,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            controller.currentIndex.value =
                                index; // Update the index
                          },
                        ),
                        items: controller.imgList
                            .map((item) => ClipRRect(
                                  child: Image.asset(
                                    item,
                                    fit: BoxFit.cover,
                                    width: Get.width,
                                    height: Get.height,
                                  ),
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                  Container(
                    color: Colors.black38,
                    width: Get.width,
                    height: 233,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Find The Best online',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Course & Learn',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              'Through a combination of lectors, reading and discussion, student will gain a solid foundation in education in educational psychology.',
                              maxLines: 3,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Dot Slider (Indicators)
                  Padding(
                    padding: const EdgeInsets.only(top: 200),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        controller.imgList.length,
                        (index) => Obx(() {
                          return AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            height: 10.0,
                            width: controller.currentIndex.value == index
                                ? 20.0
                                : 10.0,
                            decoration: BoxDecoration(
                              color: controller.currentIndex.value == index
                                  ? Colors.white
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ///////////////////////////////////////////////
            SizedBox(
              width: Get.width,
              height: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ContentText(title: "កម្មវិធីផ្សាយផ្ទាល់"),
                        ContentText(
                          title: "ទាំងអស់",
                          fontSize: 12.00,
                        ),
                      ],
                    ),
                  ),
                  // Video Thumbnail Section
                  Stack(
                    children: [
                      Image.asset('assets/images/login_bg.jpg',
                          fit: BoxFit.cover),
                      // Image.network(
                      //   "", // Replace with your actual thumbnail image URL
                      //   width: double.infinity,
                      //   height: 200,
                      //   fit: BoxFit.cover,
                      // ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Obx(
                          () => Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.fiber_manual_record,
                                    color: Colors.white, size: 12),
                                SizedBox(width: 5),
                                Text(
                                  controller.isLive.value ? "LIVE" : "OFFLINE",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 200,
                        right: 16.0,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Obx(
                            () => Text(
                              controller.liveDuration.value,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Title and Description
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle, // Makes it a circle
                              ),
                            ),
                            SizedBox(width: 8),
                            Obx(
                              () => Text(
                                controller.liveTitle.value,
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Obx(
                          () => Text(
                            controller.liveTime.value,
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
