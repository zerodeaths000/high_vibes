import 'package:flutter/material.dart';
import 'package:unitix/pages/main_page.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class Splash extends StatefulWidget {
  late VideoPlayerController controller;
  final asset = "assets/asset_outline.mp4";

  Splash({required this.controller, Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
        videoPlayerController: widget.controller,
        aspectRatio: 16 / 9,
        autoInitialize: true,
        looping: false,
        autoPlay: true,
        showControls: false,
        showOptions: false,
        errorBuilder: (context, errorMsg) {
          return Center(
            child: Text(
              errorMsg,
              style: TextStyle(color: Colors.white),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Container(
        child: Chewie(
          controller: _chewieController,
        ),
      )),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose();
    _chewieController.dispose();
  }
}
