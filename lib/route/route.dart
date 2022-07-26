import 'dart:core';

import 'package:flutter/material.dart';
import 'package:posts_mobx/pages/about/about_screen.dart';
import 'package:posts_mobx/pages/home/home_screen.dart';
import 'package:posts_mobx/pages/settings/font_size_screen.dart';
import 'package:posts_mobx/pages/settings/languages_screen.dart';
import 'package:posts_mobx/pages/settings/settings_screen.dart';
import 'package:posts_mobx/pages/settings/themes_screen.dart';
import 'package:posts_mobx/pages/splash/splash_screen.dart';
import 'package:posts_mobx/pages/users/posts_list.dart';
import 'package:posts_mobx/pages/users/users_list.dart';

class Routes {
  static const HOME_SCREEN = '_home_screen';
  static const SPLASH_SCREEN = '_splash_screen';
  static const LOGIN_SCREEN = '_login_screen';
  static const FORGET_PASSWORD_SCREEN = '_forget_pasword_screen';
  static const NEW_PIN_CODE_SCREEN = '_new_pin_code_screen';
  static const VERIFY_PIN_CODE_SCREEN = '_verify_pin_code_screen';
  static const USERS_LIST  = '_users_list';
  static const POSTS_LIST  = '_posts_list';
  static const ABOUT_SCREEN  = '_about_screen';
  static const SETTINGS_SCREEN = '_settings_screen';
  static const LANGUAGES_SCREEN = '_languages_screen';
  static const THEMES_SCREEN = '_themes_screen';
  static const FONT_SIZE_SCREEN = '_font_size_screen';
  static String CURRENT_SCREEN = '';

  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      SPLASH_SCREEN: (_) => SplashScreen(),
      HOME_SCREEN: (_) => HomeScreen(),


      ABOUT_SCREEN: (_) => AboutScreen(),

      USERS_LIST: (_) => UsersList(),

      POSTS_LIST: (_) => PostsList(),

      SETTINGS_SCREEN: (_) => SettingsScreen(),
      LANGUAGES_SCREEN: (_) => LanguagesScreen(),
      THEMES_SCREEN: (_) => ThemesScreen(),
      FONT_SIZE_SCREEN: (_) => FontSizeScreen(),
    };
  }
}
/*
String
    // HOME_SCREEN = '_home_screen',
    // SPLASH_SCREEN = '_splash_screen',
    //
    // LOGIN_SCREEN = '_login_screen',
    // FORGET_PASSWORD_SCREEN = '_forget_pasword_screen',
    // NEW_PIN_CODE_SCREEN = '_new_pin_code_screen',
    // VERIFY_PIN_CODE_SCREEN = '_verify_pin_code_screen',

    // USERS_LIST  = '_users_list',
    // POSTS_LIST  = '_posts_list',

    // ABOUT_SCREEN  = '_about_screen',
    //
    // SETTINGS_SCREEN = '_settings_screen',
    // LANGUAGES_SCREEN = '_languages_screen',
    // THEMES_SCREEN = '_themes_screen',
    // FONT_SIZE_SCREEN = '_font_size_screen',
    //
    // CURRENT_SCREEN = ''
;

 */