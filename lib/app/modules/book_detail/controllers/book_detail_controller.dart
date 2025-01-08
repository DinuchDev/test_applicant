// import 'package:get/get.dart';
// import 'package:pdfx/pdfx.dart';
//
// class BookDetailController extends GetxController {
//   //TODO: Implement BookDetailController
//   // final pdfController = PdfControllerPinch(document: null);
//   late final PdfControllerPinch pdfController;
//
//   final count = 0.obs;
//
//   RxInt currentPage = 1.obs;
//   RxInt totalPages = 0.obs;
//   RxBool isFullScreen = false.obs;
//
//   void toggleFullScreen() {
//     isFullScreen.value = !isFullScreen.value;
//   }
//
//   void goToPage(int page) {
//     pdfController.jumpToPage(page);
//     currentPage.value = page;
//   }
//
//   void updatePage(int page, int total) {
//     currentPage.value = page;
//     totalPages.value = total;
//   }
//
//   @override
//   void onInit() {
//     pdfController
//         .loadDocument('assets/lessons/lesson.pdf' as Future<PdfDocument>);
//     super.onInit();
//   }
//
//   @override
//   void onReady() {
//     super.onReady();
//   }
//
//   @override
//   void onClose() {
//     pdfController.dispose();
//     super.onClose();
//   }
//
//   void increment() => count.value++;
//
//   Future<void> toggleScreenOrientation() async {
//     if (isFullScreen.value) {
//       OrientationPlugin.forceOrientation(DeviceOrientation.portraitUp);
//     } else {
//       OrientationPlugin.forceOrientation(DeviceOrientation.landscapeRight);
//     }
//   }
// }
import 'package:flutter/services.dart'; // For screen orientation
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';

class BookDetailController extends GetxController {
  late final PdfControllerPinch pdfController;

  final count = 0.obs;

  RxInt currentPage = 1.obs;
  RxInt totalPages = 0.obs;
  RxBool isFullScreen = false.obs;

  void toggleFullScreen() {
    isFullScreen.value = !isFullScreen.value;
  }

  void goToPage(int page) {
    pdfController.jumpToPage(page);
    currentPage.value = page;
  }

  void updatePage(int page, int total) {
    currentPage.value = page;
    totalPages.value = total;
  }

  @override
  void onInit() {
    super.onInit();
    // Load the PDF document from assets
    final documentFuture = PdfDocument.openAsset('assets/lessons/lesson.pdf');
    pdfController = PdfControllerPinch(document: documentFuture);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    pdfController.dispose();
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> toggleScreenOrientation() async {
    if (isFullScreen.value) {
      // Lock to portrait orientation
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
    } else {
      // Lock to landscape orientation
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    }
  }
}
