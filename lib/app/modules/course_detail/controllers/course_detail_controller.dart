import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourseDetailController extends GetxController {
  //TODO: Implement CourseDetailController

  final count = 0.obs;

  // Current selected video URL
  var currentVideoUrl = "".obs;

  // Selected tab index: 0 (Lesson), 1 (About Course), 2 (Q&A)
  var selectedTabIndex = 0.obs;

  // Sample lesson videos (YouTube URLs)
  List<String> lessonVideos = [
    "https://youtu.be/itofWZA3ncQ?si=CrLEoxC9IgJB4m-Z",
    "https://youtu.be/itofWZA3ncQ?si=CrLEoxC9IgJB4m-Z",
    "https://youtu.be/itofWZA3ncQ?si=CrLEoxC9IgJB4m-Z",
    "https://youtu.be/itofWZA3ncQ?si=CrLEoxC9IgJB4m-Z",
    "https://youtu.be/itofWZA3ncQ?si=CrLEoxC9IgJB4m-Z",
    "https://youtu.be/itofWZA3ncQ?si=CrLEoxC9IgJB4m-Z",
    "https://youtu.be/itofWZA3ncQ?si=CrLEoxC9IgJB4m-Z",
    "https://youtu.be/itofWZA3ncQ?si=CrLEoxC9IgJB4m-Z",
    "https://youtu.be/itofWZA3ncQ?si=CrLEoxC9IgJB4m-Z",
    "https://youtu.be/itofWZA3ncQ?si=CrLEoxC9IgJB4m-Z",
    "https://youtu.be/itofWZA3ncQ?si=CrLEoxC9IgJB4m-Z",
    "https://youtu.be/itofWZA3ncQ?si=CrLEoxC9IgJB4m-Z",
    // Add more YouTube links
  ];

  Widget buildYoutubePlayer(String videoUrl) {
    if (kIsWeb) {
      return Text("YouTube playback is not supported on the web.");
    } else {
      // Mobile/Desktop platform logic
      return YoutubePlayerWidget(videoUrl);
    }
  }

  // Update the selected video
  void selectVideo(String url) {
    currentVideoUrl.value = url;
  }

  // Change selected tab
  void changeTab(int index) {
    selectedTabIndex.value = index;
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

class YoutubePlayerWidget extends StatefulWidget {
  final String videoUrl;

  const YoutubePlayerWidget(this.videoUrl, {super.key});

  @override
  _YoutubePlayerWidgetState createState() => _YoutubePlayerWidgetState();
}

class _YoutubePlayerWidgetState extends State<YoutubePlayerWidget> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl)!,
      flags: YoutubePlayerFlags(autoPlay: true, mute: false),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      liveUIColor: Colors.amber,
    );
  }
}

class FullScreenVideoPlayer extends StatelessWidget {
  final VideoPlayerController controller;

  const FullScreenVideoPlayer(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(controller),
        ),
      ),
    );
  }
}

class TabBarSection extends StatelessWidget {
  final CourseDetailController controller;

  const TabBarSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TabButton(title: "Lesson", index: 0, controller: controller),
        TabButton(title: "About Course", index: 1, controller: controller),
        TabButton(title: "Q&A", index: 2, controller: controller),
      ],
    );
  }
}

class TabButton extends StatelessWidget {
  final String title;
  final int index;
  final CourseDetailController controller;

  const TabButton(
      {super.key,
      required this.title,
      required this.index,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextButton(
          onPressed: () => controller.changeTab(index),
          child: Text(
            title,
            style: TextStyle(
              color: controller.selectedTabIndex.value == index
                  ? Colors.blue
                  : Colors.grey,
            ),
          ),
        ));
  }
}

class LessonTab extends StatelessWidget {
  final CourseDetailController controller;

  const LessonTab({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: controller.lessonVideos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Lesson ${index + 1}"),
            onTap: () => controller.selectVideo(controller.lessonVideos[index]),
          );
        },
      ),
    );
  }
}

class AboutCourseTab extends StatelessWidget {
  const AboutCourseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text("About the Course"),
      ),
    );
  }
}

class QnATab extends StatelessWidget {
  const QnATab({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text("Q&A Section"),
      ),
    );
  }
}
