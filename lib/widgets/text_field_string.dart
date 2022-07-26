import 'package:flutter/material.dart';
import 'package:posts_mobx/helper/Currency.dart';
import 'package:posts_mobx/helper/Strings.dart';
import 'package:posts_mobx/widgets/StaticWidgets.dart';
import 'package:posts_mobx/widgets/decorations.dart';

import '../../pages/_shared/base_model.dart';
import 'textEditingController.dart';

class TextFieldStringData {
  TextEditingController txtController;
  ActionType actionType;

  String label;
  String hint;
  String? txtValidate;
  int maxLength;
  bool isCurrency;

  TextFieldStringData({this.actionType = ActionType
      .New, required this.txtController, required this.label,
    required this.hint, this.txtValidate, required this.maxLength, this.isCurrency = false
  });
}

class TextFieldString extends StatelessWidget {
  TextFieldStringData textFieldStringData;

  TextFieldString({required this.textFieldStringData});

  @override
  Widget build(BuildContext context) {
    return
      Column(children: [
        TextFormField(
          keyboardType: Currency.getkeyboardType(textFieldStringData.isCurrency),
          enabled: textFieldStringData.actionType != ActionType.Show,
          maxLength: textFieldStringData.maxLength,
          validator: (value) =>
            (textFieldStringData.isCurrency ? Currency.checkErrorCurrency(value!) : value!.isNull)
              ? textFieldStringData.txtValidate
              : null,
          controller: textFieldStringData.txtController,
          onTap: () {
            textFieldStringData.txtController.selectAll(++countFocus);
          },
          decoration: Decorations.buildInputDecoration(textFieldStringData.label, textFieldStringData.hint,
              !textFieldStringData.isCurrency ? Icons.title : Icons.monetization_on),
        ),
        getSpace()]);
  }

  int countFocus = 0;
}