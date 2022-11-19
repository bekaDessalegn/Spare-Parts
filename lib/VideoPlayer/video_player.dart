import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {

  late VideoPlayerController _controller;

  @override
  void initState() {

    _controller = VideoPlayerController.asset(
        'videos/cnc.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _controller.play();
    _controller.setLooping(true);
    _controller.setVolume(0);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _controller.value.isInitialized ? Container(
        alignment: Alignment.topCenter,
        child: Stack(
          fit: StackFit.expand,
          children: [
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
          ],
        ),
      ) : CircularProgressIndicator(color: Colors.orange,)
    );
  }
}
