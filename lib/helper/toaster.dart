import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:posts_mobx/constants/font_size.dart';
import 'package:posts_mobx/helper/MyTool.dart';

class Toaster {
  static void error(String message) {
    MyTool.logPrint("error :: $message");

    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: fontSizeToaster);
  }

  static void success(String message) {
    MyTool.logPrint("success :: $message");

    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: fontSizeToaster);
  }

  static void warning(String message) {
    MyTool.logPrint("warning :: $message");

    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.orangeAccent,
        textColor: Colors.white,
        fontSize: fontSizeToaster);
  }
}
