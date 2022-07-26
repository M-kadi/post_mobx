import 'package:flutter/cupertino.dart';
import 'package:posts_mobx/helper/Numbers.dart';
import 'package:posts_mobx/widgets/text_field_int.dart';

import 'basic_type.dart';

// add data types : int, double, .. and connect them with their widgets
class IntType extends BasicType implements BasicWidget<TextFieldIntData>{
  IntType({value = 0}){
    if(value != null && (value is String))
      this.value = Numbers.StrToInt(value);
    else if(value != null && value is! int)
      this.value = 0;
    else
      this.value = value ?? 0;
  }

  // call on SaveButtonOnPress : get value from Controller
  @override
  void setValue(dynamic _value) {
    this.value = Numbers.StrToInt(_value.trim());
  }

  // call on initState : send value to Controller
  String getValueFormat() {
    return Numbers.formatInt(value).toString();
  }

  @override
  Widget getWidget(TextFieldIntData textFieldIntData){
    return TextFieldInt(textFieldIntData: textFieldIntData,);
  }
}