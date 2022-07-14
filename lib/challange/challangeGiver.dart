import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';

String rollChallange(int difficulity) {
  var diff1Array = [
    '1 KÖRBŐL KIMARADSZ',
    '30 MÁSODPERCIG TARSTD LENT A KÖVETKEUŐT, HA NEM MEGY 1 KÖRBŐL KIMARADSZ',
    'KÖVI CIGIBE BELE KELL ADNOD 500FT-OT, HA NEM ADSZ BELE CSART',
    'KÖVI CIGIT TE TEKERED',
    'FREESTYLE!',
    'ORDOGKOR 1 KORIG, INDUL.. MOST!',
    'KÖVI CIGI LIGHTY CIGI'
  ];
  var diff2Array = [
    '2 KÖRBŐL KIMARADSZ',
    '45 MÁSODPERCIG TARSTD LENT A KÖVETKEUŐT, HA NEM MEGY 2 KÖRBŐL KIMARADSZ',
    'KÖVI CIGIBE TÖBBE ADSZ MINT EBBE',
    'ORDOGKOR 2 KORIG, INDUL..MOST!',
    '3 SLUKK UTAN POROGJ A LABAIDON 30 MASODPERCIG'
  ];
  var diff3Array = [
    '60 MÁSODPERCIG TARSTD LENT A KÖVETKEUŐT, HA NEM MEGY 3 KÖRBŐL KIMARADSZ',
    '5 KÖRIG MINDEN SLUKKNÁL GHOSTOLNOD KELL, HA ELSZÁLL KOVI KORBOL KIMARADSZ',
    'VÁLTSATOK SPOTOT!',
    'AKI A LEGJOBBAN BESZAKADT SZIVJON KETTOT MOST!',
    'SZAJBA AKKORA SLUKK AMEKKORAT CSAK BIRSZ'
  ];
  var diff4Array = [
    '75 MÁSODPERCIG TARSTD LENT A KÖVETKEUŐT, HA NEM MEGY 3 KÖRBŐL KIMARADSZ',
    'A CIGI VEGEIG ORDOGKOR',
    'AKI ALIG VAN BESZAKADVA SZIVJON 3 SLUKKOT ES TARTSA LENT 30 MASODPERCIG'
  ];
  var diff5Array = [
    'TUDOBE AMIG BIROD, ES TARTSD LENT 30 SECIG, HA KÖHÖGSZ 1 KÖRBŐL KIMARADSZ',
    'ASDASDASDASDASDASD'
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
