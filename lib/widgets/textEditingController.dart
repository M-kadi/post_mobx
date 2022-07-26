import 'package:flutter/cupertino.dart';
import 'package:posts_mobx/helper/MyTool.dart';

extension TextEditingControllerExt on TextEditingController {
  void selectAll(int countFocus) {
    if (text == null || text.isEmpty)
      return;

    if(countFocus == 1) {
      selection = TextSelection(baseOffset: 0, extentOffset: text.length);
      MyTool.logPrint("selection.baseOffset selectAll");
    }
    else if(countFocus == 2) {
      selection = TextSelection(baseOffset: text.length, extentOffset: text.length);
    }
  }
}