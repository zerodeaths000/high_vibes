import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:unitix/challange/challangeGiver.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  late String time;

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

  double createCustomDialog(int diff) {
    Timer _timer;
    double _start = 30.000;
    bool pressed = false;
    int _startDisplay = _start.toInt();

    bool visibleBool = false;
    double? height = 175;
    String text = rollChallange(diff);
    if (text.contains('60 MASODPERCIG') ||
        text.contains('30 MASODPERCIG') ||
        text.contains('30 SECIG')) {
      visibleBool = true;
      if (visibleBool) {
        height = 300;
      }
    }
    AlertDialog challange = AlertDialog(
      title: Text(
        'CHALLANGE:',
        style: TextStyle(color: Colors.green, fontFamily: 'AttackGraffiti'),
      ),
      backgroundColor: Color.fromARGB(255, 38, 38, 38),
      content: Container(
        height: height,
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
          Visibility(
              maintainSize: false,
              visible: visibleBool,
              child: StatefulBuilder(
                builder: ((context, setState) {
                  return Column(children: [
                    Padding(padding: EdgeInsets.only(top: 25)),
                    Container(
                      alignment: Alignment.center,
                      height: 121,
                      width: 200,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellow, width: 5),
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: Column(
                        children: [
                          MaterialButton(
                              onPressed: () {
                                pressed = !pressed;
                                void StartTimer() {
                                  Duration duration = Duration(milliseconds: 1);
                                  _timer = Timer.periodic(
                                      duration,
                                      (Timer timer) => setState(() {
                                            if (_start == 0) {
                                              timer.cancel();
                                              debugPrint(_start.toString());
                                              _startDisplay = _start.toInt();
                                            } else if (pressed == false) {
                                              timer.cancel();
                                              _start = 30.000;
                                              _startDisplay = _start.toInt();
                                            } else if (_start != 0 &&
                                                pressed == true) {
                                              _start = _start - 0.0025;
                                              _startDisplay = _start.toInt();
                                            }
                                          }));
                                }

                                if (pressed) {
                                  StartTimer();
                                }
                              },
                              color: Colors.yellow,
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: 'KEZDÉS  ',
                                      style: TextStyle(color: Colors.black)),
                                  WidgetSpan(
                                      child: Icon(Icons.arrow_circle_right),
                                      style: TextStyle(fontSize: 27)),
                                ]),
                              )),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _startDisplay.toString(),
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              Padding(padding: EdgeInsets.only(left: 5)),
                              MaterialButton(
                                minWidth: 30,
                                onPressed: () {
                                  setState(() {
                                    if (_start < 90.000) {
                                      _start = _start + 15.000;
                                      _startDisplay = _start.toInt();
                                    } else if (_start > 90.000) {
                                      _start = 90.000;
                                      _startDisplay = _start.toInt();
                                    } else {
                                      _start = 30.000;
                                      _startDisplay = _start.toInt();
                                    }
                                    debugPrint('$_startDisplay');
                                  });
                                },
                                child: Icon(Icons.arrow_upward_outlined),
                                color: Colors.yellow,
                              )
                            ],
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                    ),
                  ]);
                }),
              ))
        ]),
      ),
    );
    showDialog(context: context, builder: (context) => challange);
    return _start;
  }
}
