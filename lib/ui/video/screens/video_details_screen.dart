import 'package:flutter/material.dart';
import 'package:gangapp_flutter/models/video_model.dart';
import 'package:gangapp_flutter/ui/video/controllers/play_video_controller.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoDetailsScreen extends StatelessWidget {
  // final String videoUrl;
  const VideoDetailsScreen({
    Key? key,
    // required this.videoUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayVideoController>(
      init: PlayVideoController(videoUrlUid: Get.arguments["videoUrl"]),
      builder: (controller) {
        return Scaffold(
          body: YoutubePlayerBuilder(
            player: YoutubePlayer(
              onEnded: (metadata) {
                Get.back();
              },
              aspectRatio: 1,
              controller: controller.youtubePlayerController,
            ),
            builder: (context, player) => Scaffold(
              appBar: AppBar(),
              body: Stack(
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.black,
                  ),
                  Center(
                    child: SizedBox(
                      height: 400,
                      child: player,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
