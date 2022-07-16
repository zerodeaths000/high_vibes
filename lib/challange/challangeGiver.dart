import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';

String rollChallange(int difficulity) {
  var diff1Array = [
    '1 körből kimaradsz',
    'Kövi cigibe bele kell adnod 500ft-ot, ha nem adsz bele csart',
    'Kövi cigit te tekered',
    'FREESTYLE!',
    'Ordogkor 1 korig, indul.. Most!',
    'Kövi cigi lighty cigi'
  ];
  var diff2Array = [
    '2 körből kimaradsz',
    'Kövi cigibe többe adsz mint ebbe',
    'Ordogkor 2 korig, indul..Most!',
    '3 slukk utan porogj a labaidon 30 masodpercig'
  ];
  var diff3Array = [
    '5 körig minden slukknál ghostolnod kell, ha elszáll kovi korbol kimaradsz',
    'Váltsatok spotot!',
    'Aki a legjobban beszakadt szivjon kettot most!',
    'Szajba akkora slukk amekkorat csak birsz'
  ];
  var diff4Array = [
    'A cigi vegeig ordogkor',
    'Aki alig van beszakadva szivjon 3 slukkot es tartsa lent 30 masodpercig'
  ];
  var diff5Array = [
    'Tudobe amig birod, es tartsd lent 30 secig, ha köhögsz 1 körből kimaradsz',
    '60 másodpercig tarstd lent a következőt, ha nem megy 3 körből kimaradsz',
  ];
  var diffAll = [];
  Random rand = Random();
  var randomNumber;

  List<String> diff1() {
    randomNumber = rand.nextInt(diff1Array.length - 1);
    return diff1Array;
  }

  List<dynamic> diff2() {
    var diff2all = List.from(diff1Array)..addAll(diff2Array);
    debugPrint(diff2all[2]);
    randomNumber = rand.nextInt(diff2all.length - 1);
    return diff2all;
  }

  List<dynamic> diff3() {
    var diff3all = [
      diff1Array,
      diff2Array,
      diff3Array,
    ].expand((x) => x).toList();
    debugPrint(diff3all[4]);
    randomNumber = rand.nextInt(diff3all.length - 1);
    return diff3all;
  }

  List<dynamic> diff4() {
    var diff4all = [diff1Array, diff2Array, diff3Array, diff4Array]
        .expand((x) => x)
        .toList();
    debugPrint(diff4all[4]);
    randomNumber = rand.nextInt(diff4all.length - 1);
    return diff4all;
  }

  List<dynamic> diff5() {
    var diff5all = [diff1Array, diff2Array, diff3Array, diff4Array, diff5Array]
        .expand((x) => x)
        .toList();
    debugPrint(diff5all[4]);
    randomNumber = rand.nextInt(diff5all.length - 1);
    return diff5all;
  }

  if (difficulity == 1) {
    diffAll = diff1();
  } else if (difficulity == 2) {
    diffAll = diff2();
  } else if (difficulity == 3) {
    diffAll = diff3();
  } else if (difficulity == 4) {
    diffAll = diff4();
  } else if (difficulity == 5) {
    diffAll = diff5();
  } else {
    debugPrint('Invalid Number');
  }

  return diffAll[randomNumber];
}
