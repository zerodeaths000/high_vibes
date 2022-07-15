import 'dart:async';

import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:unitix/slidePageRoute.dart';

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
  late Timer _valueTimer;
  late Duration _pageTimeDuration = Duration(microseconds: 1);
  int _pageTime = 0;
  double valueIndicator = 0.0;

  @override
  void initState() {
    super.initState();
    navigate();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.greenAccent));
  }

  @override
  void navigate() async {
    _valueTimer = Timer.periodic(_pageTimeDuration, (timer) {
      setState(() {
        if (_pageTime == 10000) {
          timer.cancel();
          Navigator.of(context).push(SlidePageRoute(child: MyHomePage()));
        } else {
          _pageTime++;
          debugPrint(_pageTime.toString());
          valueIndicator = _pageTime / 10000;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Splash(
          controller: VideoPlayerController.asset(asset),
        ),
        Positioned(
          bottom: 100,
          child: Container(
            alignment: Alignment.center,
            width: 300,
            height: 30,
            child: LiquidLinearProgressIndicator(
              backgroundColor: Colors.black,
              valueColor: AlwaysStoppedAnimation(Colors.greenAccent),
              borderColor: Colors.white,
              borderWidth: 1,
              direction: Axis.horizontal,
              value: valueIndicator,
            ),
          ),
        )
      ],
      alignment: Alignment.center,
    );
  }
}
