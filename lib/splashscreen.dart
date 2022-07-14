import 'dart:async';

import 'pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:unitix/splash.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  final asset = "assets/leaf_splash.mp4";

  @override
  void initState() {
    super.initState();
    navigate();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.greenAccent));
  }

  @override
  void navigate() async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Splash(
        controller: VideoPlayerController.asset(asset),
      )),
    );
  }
}
