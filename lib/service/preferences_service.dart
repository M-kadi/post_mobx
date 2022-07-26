import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:posts_mobx/constants/font_size.dart';
import 'package:posts_mobx/localization/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'locator.dart';

class PreferencesService {
  final SharedPreferences _sharedPreferences = locator.get();

  // For app localization : tr, en
  final _languageCode = 'languageCode';
  get languageCode => _get(_languageCode, AppLocalizations.languageCodeDefault);// en : default language of app

  // For app localization : tr, en
  final _languageName = 'languageName';
  get languageName => _get(_languageName, AppLocalizations.languageNameDefault);

  // For app localization : tr, en
  final _languageID = 'languageID';
  get languageID => _getInt(_languageID, AppLocalizations.languageIDDefault);// en : default language of app

  setLanguageCode(lanCode, lanName, lanID, context) {
    _put(_languageCode, lanCode);
    _put(_languageName, lanName);
    _putInt(_languageID, lanID);

    MyApp.setLocale(context, Locale(lanCode));
  }

  // add Change Font Size App : Settings
  static const fontSizeName0 = '0 %';
  static const fontSizeName25 = '25 %';
  static const fontSizeName50 = '50 %';
  static const fontSizeName75 = '75 %';

  static const fontSizeID25 = 25;

  final _fontSizeName = 'fontSizeName';
  get fontSizeName => _get(_fontSizeName, fontSizeName25);

  final _fontSizeID = 'fontSizeID';
  get fontSizeID => _getInt(_fontSizeID, fontSizeID25);


  setFontSizeApp(fontSizeName, fontSizeID) {
    _put(_fontSizeName, fontSizeName);
    _putInt(_fontSizeID, fontSizeID);

    // Increase Font Size Text : all App
    changeValuesPercent(fontSizeID); // default 25 %
  }

  // For app theme : light, dark
  final _themeMode =  'themeMode';
  get themeMode => _get(_themeMode, ThemeMode.system.toString());
  set themeMode(themeMode) => _put(_themeMode, themeMode);

  // For app theme : light, dark
  final _themeID = 'themeID';
  get themeID => _getInt(_themeID, 0);
  set themeID(themeID) => _putInt(_themeID, themeID);


  // For app theme : light, dark
  final _themeName = 'themeName';
  get themeName => _get(_themeName, LocalStr.SystemTheme.toStr());
  set themeName(themeName) => _put(_themeName, themeName);

  _put(String key, String value) {
    _sharedPreferences.setString(key, value);
  }

  String _get(String key, String defaultValue) {
    return _sharedPreferences.getString(key) ?? defaultValue;
  }


  _putInt(String key, int value) {
    _sharedPreferences.setInt(key, value);
  }

  int _getInt(String key, int defaultValue) {
    return _sharedPreferences.getInt(key)  ?? defaultValue;
  }
}