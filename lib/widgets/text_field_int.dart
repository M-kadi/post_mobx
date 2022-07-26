import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pattern_formatter/numeric_formatter.dart';
import 'package:posts_mobx/helper/Strings.dart';
import 'package:posts_mobx/widgets//StaticWidgets.dart';
import 'package:posts_mobx/widgets/decorations.dart';

import '../../pages/_shared/base_model.dart';
import 'textEditingController.dart';

class TextFieldIntData{
  TextEditingController txtController;
  ActionType? actionType;

  String label;
  String hint;
  String? txtValidate;
  IconData? iconData;
  int maxLength;

  bool isThousandsFormatter;
  bool isCheckMaxLength;
  bool isHideCounterLength;
  bool isObscureText;

  Function(String)? onChanged;

  TextFieldIntData({this.actionType = ActionType.New, required this.txtController, required this.label, required this.hint, required this.txtValidate, this.iconData = null, this.maxLength = 15,
    this.isThousandsFormatter = false, this.onChanged = null, this.isCheckMaxLength = false,
    this.isHideCounterLength = true,
    this.isObscureText = false});

  int countFocus = 0;
}

class TextFieldInt extends StatelessWidget {
  TextFieldIntData textFieldIntData;

  TextFieldInt({required this.textFieldIntData});

  @override
  Widget build(BuildContext context) {
    return
      Column(children: [
        TextFormField(
            onChanged: textFieldIntData.onChanged,
            obscureText: textFieldIntData.isObscureText,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            maxLength: textFieldIntData.maxLength,
            enabled: textFieldIntData.actionType == null || textFieldIntData.actionType != ActionType.Show,
            keyboardType: TextInputType.number,
            validator: (value) => (!textFieldIntData.isCheckMaxLength) ?
              (value!.isNull ? textFieldIntData.txtValidate : null) :
              (Strings.checkTextFieldLength(value!, textFieldIntData.maxLength) ? textFieldIntData.txtValidate : null),
            controller: textFieldIntData.txtController,
            onTap: () => textFieldIntData.txtController.selectAll(++countFocus),
            decoration: Decorations.buildInputDecoration(
                textFieldIntData.label, textFieldIntData.hint, textFieldIntData.iconData ?? Icons.confirmation_number,
                isHideCounterLength: textFieldIntData.isHideCounterLength),
            inputFormatters: (!textFieldIntData.isThousandsFormatter) ?
              (<TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]) :
              (<TextInputFormatter>[FilteringTextInputFormatter.digitsOnly,
              ThousandsFormatter(formatter: NumberFormat.decimalPattern("tr"))
              ])
        ),

        getSpace()]);
  }
  int countFocus = 0;
}