import 'package:flutter/foundation.dart';

class MyTool {
  static void logPrint(Object? object) {
    if (kReleaseMode == false)
      print(object);
  }
}