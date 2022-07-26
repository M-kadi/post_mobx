import 'package:flutter/cupertino.dart';
import 'package:posts_mobx/widgets/text_field_string.dart';

import 'basic_type.dart';

// add data types : int, double, .. and connect them with their widgets
class StringType extends BasicType implements BasicWidget<TextFieldStringData>{
  StringType({dynamic value = ''}):super(value: value);

  @override
  Widget getWidget(TextFieldStringData  textFieldStringData){
    return TextFieldString(textFieldStringData: textFieldStringData,);
  }
}