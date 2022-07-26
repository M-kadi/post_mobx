import 'package:flutter/cupertino.dart';
import 'package:posts_mobx/helper/Strings.dart';

abstract class BasicWidget<Type> {
  Widget getWidget(Type widgetData);
}

class BasicType{
  BasicType({value = ''}){
    if(value != null && value is! String)
      this._value = '';
    else
      this._value = value ?? '';
  }

  late dynamic _value;

  // call on toJson()
  dynamic get value {
    return _value;
  }

  // call on get(json)
  void set value(dynamic _value) {
    this._value = _value;
  }

  // call on SaveButtonOnPress : get value from Controller
  void setValue(dynamic _value) {
    this._value = _value.trim();
  }

  bool isNotValidate() {
    if(_value != null && _value is String)
      return (this._value as String).isNull;

    return false;
  }
}