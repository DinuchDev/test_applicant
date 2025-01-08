import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  RxBool isSearchVisible = false.obs;
  var currentIndex = 0.obs;
  final List<String> imgList = [
    "assets/tem/slider1.jpg",
    "assets/tem/slider2.jpg",
    "assets/tem/slider3.jpg"
  ];

  //Example state variables
  var isLive = true.obs; // To indicate live status
  var liveTitle = "បុណ្យពិសាកបូជាប្រារព្ធនៅថ្ងៃខុសគ្នានៅប្រទេសផ្សេង".obs;
  var liveDuration = "3:25:13".obs;
  var liveTime = "ផ្សាយ ៧១ ខែកុម្ភៈ ២០២៥ ម៉ោង ០៤:២០".obs;

  void toggleLive() {
    isLive.value = !isLive.value;
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

