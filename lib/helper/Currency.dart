import 'package:flutter/cupertino.dart';
import 'package:posts_mobx/helper/Numbers.dart';
import 'package:posts_mobx/helper/Strings.dart';

class Currency{
  static int decimalDigitsCurrency = 7;
  static int decimalDigits = 2;

  static getkeyboardType(bool isCurrency){
    return !isCurrency ? null : TextInputType.number;
  }

  static String formatCurrency(double val, {prefix  = null, checkZero = false, sufix = ""}){
    try {
      // add checkZero : if val == 0 ==> "" : (formatDouble)
      if(checkZero && val == 0)
        return "";

      var result = val.toString();

      try {
        if (Numbers.Local == Numbers.Local_TR)
          result = result.trim().replaceAll(Numbers.Group, Numbers.Fraction);
      }
      finally {}

      return result;
    }
    catch (Exception){
      return "";
    }
  }

  static bool checkErrorCurrency(String val){
    return  val.isNull || Numbers.StrToDouble(val.trim()) == 0.0;
  }
}