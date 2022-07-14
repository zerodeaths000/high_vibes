import 'package:flutter/material.dart';
import 'package:unitix/splash.dart';
import 'package:unitix/splashscreen.dart';
import 'pages/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: VideoPlayerScreen(),
    );
  }
}
