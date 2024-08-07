import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/screens/training/widgets/foryou_/widgets/full_screen_video.dart.dart';
import 'package:video_player/video_player.dart';

class VideoSection extends StatelessWidget {
  final String title;
  final List<String> videoUrls;
  final PageController pageController;
  final Function(int) onPageChanged;
  final List<VideoPlayerController> controllers;

  const VideoSection({
    super.key,
    required this.title,
    required this.videoUrls,
    required this.pageController,
    required this.onPageChanged,
    required this.controllers,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 400,
          child: PageView.builder(
            controller: pageController,
            onPageChanged: onPageChanged,
            itemCount: videoUrls.length,
            itemBuilder: (context, index) {
              return Container(
                width: 180,
                margin: const EdgeInsets.only(right: 5),
                color: Colors.grey[300],
                child: VideoPlayerWidget(
                  url: videoUrls[index],
                  controller: controllers[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class VideoPlayerWidget extends StatelessWidget {
  final String url;
  final VideoPlayerController controller;

  const VideoPlayerWidget({
    super.key,
    required this.url,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => FullScreenVideoScreen(controller: controller));
      },
      child: controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
