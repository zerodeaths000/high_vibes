import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:unitix/challange/challangeGiver.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              color: Colors.green,
              child: Column(children: [
                Center(
                  child: Column(children: [
                    Image.asset('assets/page_1.png', scale: 1.6),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Text(
                      'BESZAKDAS',
                      style: new TextStyle(
                          fontFamily: 'AttackGraffiti', fontSize: 30),
                    ),
                    Padding(padding: EdgeInsets.only(top: 50)),
                    Container(
                      width: 300,
                      height: 200,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.greenAccent, width: 7),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 48,
                                width: 300,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.yellow, width: 2),
                                    borderRadius:
                                        BorderRadius.all((Radius.circular(7)))),
                                padding: EdgeInsets.only(left: 10, top: 10),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: 'NEHÉZSÉG: ',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontFamily: 'AttackGraffiti'),
                                    ),
                                    WidgetSpan(
                                        child: Icon(Icons.star),
                                        style: TextStyle(fontSize: 27)),
                                    WidgetSpan(
                                        child: Icon(Icons.star),
                                        style: TextStyle(fontSize: 27)),
                                    WidgetSpan(
                                        child: Icon(Icons.star),
                                        style: TextStyle(fontSize: 27)),
                                    WidgetSpan(
                                        child: Icon(Icons.star_border),
                                        style: TextStyle(fontSize: 27)),
                                    WidgetSpan(
                                        child: Icon(Icons.star_border),
                                        style: TextStyle(fontSize: 27)),
                                  ]),
                                )),
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(top: 50),
                              child: MaterialButton(
                                splashColor: Colors.green,
                                onPressed: () {
                                  createCustomDialog(5);
                                },
                                color: Colors.yellow,
                                child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: 'KEZDÉS  ',
                                        style: TextStyle(
                                            fontFamily: 'AttackGraffiti',
                                            color: Colors.black)),
                                    WidgetSpan(
                                        child: Icon(
                                            Icons.arrow_circle_right_sharp),
                                        style: TextStyle(fontSize: 27))
                                  ]),
                                ),
                              ),
                            )
                          ]),
                    )
                  ]),
                )
              ]),
            ),
            Container(
              padding: EdgeInsets.only(top: 30),
              color: Colors.yellow,
              child: Column(children: [
                Center(
                  child: Column(children: [
                    Image.asset('assets/page_2.png', scale: 1.6),
                    //Padding(padding: EdgeInsets.only(top: 20)),
                    Text(
                      'LIGHT CIGI',
                      style: new TextStyle(
                          fontFamily: 'DripGraffiti', fontSize: 40),
                    )
                  ]),
                )
              ]),
            ),
          ],
        ));
  }

  void createCustomDialog(int diff) {
    Timer _timer;
    int _start = 45;
    bool pressed = false;
    String time = _start.toString();

    void StartTimer(int dur) {
      Duration duration = Duration(seconds: dur);
      _timer = Timer.periodic(duration, (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            debugPrint(_start.toString());
          });
        } else {
          setState(() {
            _start--;
            time = _start.toString();
            debugPrint(time);
          });
        }
      });
    }

    String text = rollChallange(diff);
    AlertDialog challange = AlertDialog(
      title: Text(
        'CHALLANGE:',
        style: TextStyle(color: Colors.green, fontFamily: 'AttackGraffiti'),
      ),
      backgroundColor: Color.fromARGB(255, 38, 38, 38),
      content: Container(
        height: 250,
        width: 150,
        child: Column(children: [
          Container(
              alignment: Alignment.center,
              height: 150,
              width: 200,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 7),
                  borderRadius: BorderRadius.all(Radius.circular(7))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.only(top: 10, left: 50)),
                  Text(
                    text,
                    style: TextStyle(color: Colors.white, fontFamily: 'Yanone'),
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
          Container(
            child: Column(children: [
              MaterialButton(
                onPressed: () {
                  if (_start == 45) {
                    StartTimer(1);
                  }
                },
                color: Colors.yellow,
                child: Text('asd'),
              ),
              Text(
                time,
                style: TextStyle(fontSize: 40, color: Colors.white),
              )
            ]),
          )
        ]),
      ),
    );
    showDialog(context: context, builder: (context) => challange);
  }
}
