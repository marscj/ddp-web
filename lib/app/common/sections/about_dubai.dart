import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class AboutDubai extends StatefulWidget {
  AboutDubai({Key? key}) : super(key: key);

  @override
  State<AboutDubai> createState() => _AboutDubaiState();
}

class _AboutDubaiState extends State<AboutDubai> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(
        'assets/videos/3b2370a48f37e920314f4e4a7f796b43.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : Container(),
    );
  }
}
