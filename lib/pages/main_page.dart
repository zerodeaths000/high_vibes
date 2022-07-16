import 'dart:async';
import 'dart:ffi';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:unitix/challange/challangeGiver.dart';
import 'package:unitix/repeatingContainer.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  late String time;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        body: LiquidSwipe(
          enableSideReveal: false,
          slideIconWidget: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          pages: [
            Container(
              padding: EdgeInsets.only(top: 30),
              color: Color.fromARGB(255, 50, 205, 50),
              child: Column(children: [
                Center(
                  child: Column(children: [
                    Image.asset('assets/page_1.png', scale: 1.6),
                    Padding(padding: EdgeInsets.only(top: 35)),
                    Text(
                      'BESZAKDAS',
                      style: new TextStyle(
                          fontFamily: 'AttackGraffiti', fontSize: 30),
                    ),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    ChallangeContainer(
                        borderColor: Color.fromARGB(255, 77, 252, 77),
                        childBorderColor: Color.fromARGB(255, 77, 252, 77),
                        buttonColor: Color.fromARGB(255, 99, 255, 99),
                        diff: 3)
                  ]),
                )
              ]),
            ),
            Container(
              padding: EdgeInsets.only(top: 30),
              color: Color.fromARGB(255, 255, 240, 31),
              child: Column(children: [
                Center(
                  child: Column(children: [
                    Image.asset('assets/page_2.png', scale: 1.6),
                    //Padding(padding: EdgeInsets.only(top: 20)),
                    Text(
                      'LIGHT CIGI',
                      style: new TextStyle(
                          fontFamily: 'AttackGraffiti', fontSize: 30),
                    )
                  ]),
                ),
                Padding(padding: EdgeInsets.only(top: 15)),
                ChallangeContainer(
                    borderColor: Color.fromARGB(255, 177, 169, 68),
                    childBorderColor: Color.fromARGB(255, 177, 169, 68),
                    buttonColor: Color.fromARGB(255, 224, 218, 122),
                    diff: 2)
              ]),
            ),
          ],
        ));
  }
}
