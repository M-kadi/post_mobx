import 'package:intl/intl.dart';

import 'Currency.dart';

class Numbers{
  static const Local_TR = "tr_TR"; // 'en_US'; //
  static const Local_TR_Currency = "\₺";

  static const STR_TR_Currency = "(" + Numbers.Local_TR_Currency + "): ";

  static String Local = Local_TR;
  static String Group = ".";
  static String Fraction = ",";
  static String GroupCurrency = ",";

  static String formatInt(int val, {prefix  = null, checkZero = false}){
    try {
      // add checkZero : if val == 0 ==> "" : (formatInt)
      if(checkZero && val == 0)
        return "";

      var formatter  = NumberFormat.decimalPattern(Numbers.Local);
      var result =  (prefix ?? "") + formatter.format(val).toString();

      return result;
    }
    catch (Exception){
      return "";
    }
  }

  static String formatDouble(double val, {prefix  = null, checkZero = false, sufix = ""}){
    try {
      // add checkZero : if val == 0 ==> "" : (formatDouble)
      if(checkZero && val == 0)  return "";

      // Double fixed "decimal places" => 0.00 (2)
      val = double.parse(val.toStringAsFixed(Currency.decimalDigits));
      var formatter = NumberFormat.decimalPattern(Numbers.Local);
      String result = formatter.format(val).toString();

      // Every time add : .00 to end of Double
      if (!result.contains(Numbers.Fraction))
        result += "${Numbers.Fraction}00";

      result = (prefix ?? "") + result + sufix;

      if(result == "${Numbers.Fraction}00")
        result = "0";

      return result;
    }
    catch (Exception){
      return "";
    }
  }

  // add StrToDouble : Numbers : Check when get from dio_api (SelectedItem): Local TR :: 1222,5 => 1222.5
    // Because c# dio_api return double.ToString() in Turkish Format (with ,)
  static double StrToDoubleWithCheck(String val, {defaultVal = 0.0}) {
    var result = defaultVal;

    try {
        val = val.trim().replaceAll(Numbers.Fraction, Numbers.Group);
    }
    finally {}

    try {
      result = double.tryParse(val) ?? defaultVal;
    }
    catch (Exception){}

    return result;
  }

  static double StrToDouble(String val, {defaultVal = 0.0, withController = true}){
    var result = defaultVal;
    if(withController ) {
      try {
        val = val.trim().replaceAll(Numbers.Group, "");
        if (Numbers.Local == Local_TR)
          val = val.trim().replaceAll(Numbers.Fraction, Numbers.Group);
      }
      finally {}
    }

    try {
      result = double.tryParse(val) ?? defaultVal;
    }
    catch (Exception){}

    return result;
  }

  static int StrToInt(String val, {defaultVal = 0}){
    var result = defaultVal;

    try {
      val = val.trim().replaceAll(Numbers.Group, "");
    }
    catch (Exception){}

    try {
      result = int.tryParse(val) ?? defaultVal;
    }
    catch (Exception){}

    return result;
  }
}