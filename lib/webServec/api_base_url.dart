import 'dart:developer';

import 'package:flutter/foundation.dart';

class APIBase {
  static String get baseURL {
    var testURL = "https://abati.linekwdemo3.com/api/";
    var MainURL = "https://abati.linekwdemo3.com/api/";

    if (kReleaseMode) {
      return MainURL;
    } else {
      return testURL;
    }
  }
}
void printWarningLong(String text) {
  print('\x1B[33m//////////////////////////////////////////////////////////////////////////\x1B[0m');
  log(text) ;

  print('\x1B[37m''\x1B[0m');
}
void printWarning(String text) {
  print('\x1B[33m$text\x1B[0m');
  log(text) ;
  print('\x1B[37m''\x1B[0m');
}
void printGreen(String text) {
  print('\x1B[32m$text\x1B[0m');
  print('\x1B[37m''\x1B[0m');
}
void printBlue(String text) {
  print('\x1B[34m$text\x1B[0m');
  print('\x1B[37m''\x1B[0m');
}