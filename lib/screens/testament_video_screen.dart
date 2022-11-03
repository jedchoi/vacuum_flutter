import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';

class TestamentVideoScreen extends StatefulWidget {
  final String filePath;

  const TestamentVideoScreen({Key? key, required this.filePath})
      : super(key: key);

  @override
  _TestamentVideoScreenState createState() => _TestamentVideoScreenState();
}

class _TestamentVideoScreenState extends State<TestamentVideoScreen> {
  late VideoPlayerController _videoPlayerController;

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Future _initVideoPlayer() async {
    _videoPlayerController = VideoPlayerController.file(File(widget.filePath));
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    await _videoPlayerController.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Testament Video Screen'),
      ),
      extendBodyBehindAppBar: true,
      body: FutureBuilder(
        future: _initVideoPlayer(),
        builder: (context, state) {
          if (state.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return VideoPlayer(_videoPlayerController);
          }
        },
      ),
    );
  }
}
