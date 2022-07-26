import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pattern_formatter/numeric_formatter.dart';
import 'package:posts_mobx/helper/Numbers.dart';
import 'package:posts_mobx/helper/Strings.dart';
import 'package:posts_mobx/pages/_shared/base_model.dart';
import 'package:posts_mobx/widgets/decorations.dart';
import 'package:posts_mobx/widgets/textEditingController.dart';

import 'StaticWidgets.dart';

class TextFieldDoubleData {
  TextEditingController txtController;
  ActionType actionType;

  String label;
  String? hint;
  String? txtValidate;
  int? maxLength;

  // add other bool enabledItem : TextFieldDouble
  bool enabledItem;

  // add onChanged : TextFieldDouble
  Function(String)? onChangedTxtDouble;

  TextFieldDoubleData({this.enabledItem = true, required this.actionType,
    required this.txtController, required this.label, required this.hint,
    required this.txtValidate, this.maxLength = 20, this.onChangedTxtDouble = null});

  int countFocus = 0;
}

class TextFieldDouble extends StatelessWidget {
  TextFieldDoubleData textFieldDoubleData;

  TextFieldDouble({required this.textFieldDoubleData});

  @override
  Widget build(BuildContext context) {
    return
      // add space in TextField
      Column(children: [
        TextFormField(
          onChanged: textFieldDoubleData.onChangedTxtDouble,
          maxLength: textFieldDoubleData.maxLength,
          enabled: textFieldDoubleData.actionType != ActionType.Show &&
              textFieldDoubleData.enabledItem,
          keyboardType: TextInputType.number,
          inputFormatters: [
            ThousandsFormatter(
                formatter: NumberFormat.decimalPattern(Numbers.Local),
                allowFraction: true)
          ],
          validator: (value) =>
          value!.isNull
              ? textFieldDoubleData.txtValidate
              : null,
          controller: textFieldDoubleData.txtController,
          // add SelectAll onFocus : Text
          onTap: () => textFieldDoubleData.txtController.selectAll(
              ++textFieldDoubleData.countFocus),
          decoration: Decorations.buildInputDecoration(
              textFieldDoubleData.label, textFieldDoubleData.hint ?? '',
              Icons.confirmation_number),
        ),

        getSpace()]);
  }
}