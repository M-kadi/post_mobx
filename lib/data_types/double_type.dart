import 'package:flutter/cupertino.dart';
import 'package:posts_mobx/helper/Numbers.dart';
import 'package:posts_mobx/widgets/text_field_double.dart';

import 'basic_type.dart';

// add data types : int, double, .. and connect them with their widgets
class DoubleType extends BasicType implements BasicWidget<TextFieldDoubleData>{
  DoubleType({value = 0.0}){
    if(value != null && (value is String))
      this.value = Numbers.StrToDouble(value, withController: false);
    else if(value != null && value is! double)
      this.value = 0.0;
    else
      this.value = value ?? 0.0;
  }

  // call on SaveButtonOnPress : get value from Controller
  @override
  void setValue(dynamic _value) {
    this.value = Numbers.StrToDouble(_value.trim());
  }

  void setValueFromDB(String _value) {
    this.value = Numbers.StrToDouble(_value.trim(), withController: false);
  }

  // call on initState : send value to Controller
  String getValueFormat() {
    return Numbers.formatDouble(value).toString();
  }

  String getValueTxt() {
    if(value - value.toInt() == 0)
      return value.toInt().toString();

    return value.toString();
  }

  @override
  Widget getWidget(TextFieldDoubleData textFieldDoubleData){
    return TextFieldDouble(textFieldDoubleData: textFieldDoubleData,);
  }
}