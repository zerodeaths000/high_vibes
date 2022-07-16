import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:unitix/challange/challangeGiver.dart';
import 'package:unitix/pages/main_page.dart';
import 'package:unitix/starHolder.dart';

class ChallangeContainer extends StatefulWidget {
  final Color borderColor;
  final Color childBorderColor;
  final Color buttonColor;

  final int diff;

  const ChallangeContainer(
      {Key? key,
      required this.borderColor,
      required this.childBorderColor,
      required this.buttonColor,
      required this.diff})
      : super(key: key);

  @override
  State<ChallangeContainer> createState() => _ChallangeContainerState();
}

class _ChallangeContainerState extends State<ChallangeContainer> {
  late MyHomePageState mhp = MyHomePageState();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 300,
      height: 200,
      decoration: BoxDecoration(
          border: Border.all(color: widget.borderColor, width: 7),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            alignment: Alignment.center,
            height: 48,
            width: 300,
            decoration: BoxDecoration(
                border: Border.all(color: widget.childBorderColor, width: 2),
                borderRadius: BorderRadius.all((Radius.circular(7)))),
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Row(
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'NEHÉZSÉG: ',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: 'AttackGraffiti'),
                    ),
                  ]),
                ),
                StarHolderContainer(diff: widget.diff)
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
            )),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 50),
          child: MaterialButton(
            splashColor: Colors.green,
            onPressed: () {
              createCustomDialog(widget.diff);
            },
            color: widget.buttonColor,
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: 'KEZDÉS  ',
                    style: TextStyle(
                        fontFamily: 'AttackGraffiti', color: Colors.black)),
                WidgetSpan(
                    child: Icon(Icons.arrow_circle_right_sharp),
                    style: TextStyle(fontSize: 27))
              ]),
            ),
          ),
        )
      ]),
    );
  }

  void createCustomDialog(int diff) {
    AudioPlayer player = AudioPlayer();
    AssetSource soundSource = AssetSource('exhale.mp3');

    Timer _timer;
    double _start = 30.000;
    bool pressed = false;
    int _startDisplay = _start.toInt();

    bool visibleBool = false;
    double? height = 213;
    String text = rollChallange(diff);
    //String text = '60 masodpercig';
    if (text.contains('60 masodpercig') ||
        text.contains('30 masodpercig') ||
        text.contains('30 secig')) {
      visibleBool = true;
      if (visibleBool) {
        height = 300;
      }
    }
    AlertDialog challange = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      contentPadding: EdgeInsets.all(0),
      elevation: 7.0,
      /*title: Text(
        'CHALLANGE:',
        style: TextStyle(
            color: Color.fromARGB(255, 50, 205, 50),
            fontFamily: 'AttackGraffiti'),
      ),*/
      backgroundColor: Color.fromARGB(255, 43, 43, 43),
      content: Container(
        decoration: BoxDecoration(
            border:
                Border.all(width: 6, color: Color.fromARGB(255, 92, 92, 92)),
            borderRadius: BorderRadius.all(Radius.circular(32.0))),
        height: height,
        child: Column(children: [
          Padding(padding: EdgeInsets.only(top: 10)),
          Container(
            padding: EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              'ChALLANGE: ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 50, 205, 50),
                  fontFamily: 'AttackGraffiti',
                  fontSize: 20),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Container(
              alignment: Alignment.center,
              height: height - 63,
              width: 250,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(255, 50, 205, 50), width: 4.5),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                  ),
                  Visibility(
                      maintainSize: false,
                      visible: visibleBool,
                      child: StatefulBuilder(
                        builder: ((context, setState) {
                          return Container(
                              alignment: Alignment.center,
                              width: 210,
                              height: 105,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2.5,
                                      color: Color.fromARGB(255, 50, 205, 50)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3))),
                              child: Column(
                                children: [
                                  MaterialButton(
                                      minWidth: 1,
                                      height: 8,
                                      onPressed: () {
                                        pressed = !pressed;
                                        void StartTimer() {
                                          Duration duration =
                                              Duration(milliseconds: 10);
                                          _timer = Timer.periodic(
                                              duration,
                                              (Timer timer) => setState(() {
                                                    if (_start <= 0) {
                                                      timer.cancel();
                                                      debugPrint(
                                                          _start.toString());
                                                      _startDisplay =
                                                          _start.toInt();
                                                      player.play(soundSource);
                                                      Navigator.pop(context);
                                                    } else if (pressed ==
                                                        false) {
                                                      timer.cancel();
                                                      _start = 30.000;
                                                      _startDisplay =
                                                          _start.toInt();
                                                    } else if (_start != 0 &&
                                                        pressed == true) {
                                                      _start = _start - 0.01;
                                                      _startDisplay =
                                                          _start.toInt();
                                                    }
                                                  }));
                                        }

                                        if (pressed) {
                                          StartTimer();
                                        }
                                      },
                                      color: Color.fromARGB(255, 50, 205, 50),
                                      child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: 'Start',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontFamily: 'DripGraffiti')),
                                          WidgetSpan(
                                              child: Icon(
                                                  Icons.arrow_circle_right),
                                              style: TextStyle(fontSize: 27)),
                                        ]),
                                      )),
                                  Container(
                                    width: 100,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 3,
                                            color: Color.fromARGB(
                                                255, 50, 205, 50))),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          _startDisplay.toString(),
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(left: 5)),
                                        MaterialButton(
                                          minWidth: 7,
                                          height: 5,
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
                                          child:
                                              Icon(Icons.arrow_upward_outlined),
                                          color:
                                              Color.fromARGB(255, 50, 205, 50),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ));
                        }),
                      )),
                  Padding(padding: EdgeInsets.only(top: 10, left: 100)),
                  Container(
                    width: 210,
                    height: 98,
                    alignment: Alignment.center,
                    child: Text(
                      text,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Kanit',
                          fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )),
        ]),
      ),
    );
    showDialog(context: context, builder: (context) => challange);
  }
}
