extension ExtendedString on String {
  // Remove * from last word if exist : Adi* => Adi
  String get removeLastCharStar {
    if(!isNull && this[length - 1] == '*') {
      return substring(0, length - 1);
    }

    return this;
  }

  bool get isNull{
    return this == null || isEmpty;
  }
}

class Strings {
  static bool checkTextFieldLength(String val, int maxLength) {
    if (!(val == null || val.isEmpty))
      return val.length != maxLength;
    else
      return true;
  }

  static bool checkEmail(String val) {
    String regex =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(regex);

    return !(val.isNotEmpty && regExp.hasMatch(val));
  }

  static bool checkMobile(String val) {
    //05053899820
    return val.isNull || val.length != 11;
  }

  static String addStr(String val, String prefix,
      {String sufix = "", bool checkZero = false, bool checkNullStrVal = false}) {
    if (!val.isNull) {
      if (checkZero && val == "0")
        return "";

      if (checkNullStrVal && val.trim().toLowerCase() == "null")
        return "";

      return prefix + val + sufix;
    }
    else
      return "";
  }

  static String add2Strs(String val1, String val2) {
    if (!val1.isNull && !val2.isNull)
      return val2 + "\n" + val1;
    else
      return val2 + val1;
  }
}