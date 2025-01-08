import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';

import '../controllers/book_detail_controller.dart';

class BookDetailView extends GetView<BookDetailController> {
  const BookDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
            'Page ${controller.currentPage.value}/${controller.totalPages.value}')),
        actions: [
          IconButton(
            icon: Obx(() => Icon(controller.isFullScreen.value
                ? Icons.fullscreen_exit
                : Icons.fullscreen)),
            onPressed: controller.toggleFullScreen,
          ),
        ],
      ),
      body: Obx(() => Column(
        children: [
          if (!controller.isFullScreen.value)
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.totalPages.value,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => controller.goToPage(index + 1),
                    child: Container(
                      width: 100,
                      margin: const EdgeInsets.all(4),
                      color: Colors.grey,
                      child: Center(child: Text('Page ${index + 1}')),
                    ),
                  );
                },
              ),
            ),
          Expanded(
            child: PdfViewPinch(
              controller: controller.pdfController,
              onDocumentLoaded: (document) {
                controller.totalPages.value = document.pagesCount; // Set total pages
              },
              onPageChanged: (page) {
                controller.updatePage(page, controller.totalPages.value); // Update current page
              },
            ),
          ),

        ],
      )),
    );
  }
}
