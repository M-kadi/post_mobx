import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posts_mobx/constants/font_size.dart';

import 'StaticWidgets.dart';

// add class ActionBtn
class ActionBtn extends StatelessWidget {
  void Function() onPressCallback;
  String titleBtn;
  double widthBtn;

  ActionBtn({required this.onPressCallback, required this.titleBtn, this.widthBtn = 1,});

  _buildButton() {
    return
      ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(15.0)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radiusButton), //90
                )
            )
        ),
        child: AutoSizeText(titleBtn,
          style: TextStyle(fontSize: fontSizeToaster),
          maxLines: 1,
        ),
        onPressed: () {
          onPressCallback();
        },
      );
  }
  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: MediaQuery
          .of(context)
          .size
          .width * this.widthBtn,
        height: 50.0,
        child: _buildButton(),
    );
  }
}