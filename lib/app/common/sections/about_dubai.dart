import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'package:ddp_web/app/common/extensions/widget.dart';

class AboutDubai extends StatefulWidget {
  AboutDubai({Key? key}) : super(key: key);

  @override
  State<AboutDubai> createState() => _AboutDubaiState();
}

class _AboutDubaiState extends State<AboutDubai> {
  late VideoPlayerController _controller;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();

    initializePlayer();
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    _controller = VideoPlayerController.asset(
        'assets/videos/3b2370a48f37e920314f4e4a7f796b43.mp4');

    await _controller.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: true,
      looping: true,
      allowFullScreen: false,
      allowedScreenSleep: false,
      allowMuting: false,
      allowPlaybackSpeedChanging: false,
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _chewieController != null &&
              _chewieController!.videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Chewie(
                controller: _chewieController!,
              ),
            ).responsive()
          : Container(),
    );
  }
}
