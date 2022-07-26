import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posts_mobx/helper/text_styles.dart';
import 'package:posts_mobx/localization/app_localizations.dart';

import '../constants/colors.dart';
import 'locator.dart';
import 'preferences_service.dart';
import 'provider_service.dart';

class ThemeManager extends ChangeNotifier implements IProviderService {

  static Icon getIcon(iconData, {isSelected = false}) {
    return Icon(iconData, color: ThemeManager.isLight || isSelected ? null
        : AppColors.borderDark,);
  }

  static Color getColorStatusBar() {
    return ThemeManager.isLight ? AppColors.primaryLight : AppColors.primaryDark;
  }

  static Color getRowDark() {
    return ThemeManager.isLight ? AppColors.rowDarkLight : AppColors.rowDarkNight;
  }

  // add getColorTxtFlatButton : Forget Btn : Light/Dark
  static Color? getColorTxtFlatButton() {
    return ThemeManager.isLight ? null : AppColors.borderDark;
  }

  static Color getColorBorder() {
    return ThemeManager.isLight ? AppColors.borderLight : AppColors.borderDark;
  }

  // https://stackoverflow.com/questions/56411599/flutter-textformfield-change-labelcolor-on-focus
  // need to focusNode && StatefulWidget  && setState
  // myFocusNode.addListener((){ setState((){}); }) don't forget to dispose of your listeners to prevent memory leaks.
  // Change text color text dark focus
  static Color getColorTxtFieldFocus() {
    // print("getColorTxtFieldFocus ${ThemeManager.isLight || (!ThemeManager.isLight && !hasFocus)}");

    return ThemeManager.isLight ? AppColors.darkNotification : AppColors.borderDark;
  } //AppColors.dark_gray

  static Color getColorTextDashboard() {
    return ThemeManager.isLight ? Colors.black : AppColors.borderDark;
  }

  static Color getColorTextDashboardGray() {
    return AppColors.borderLight;
  }

  final PreferencesService _preferencesService = locator.get();

  @override
  void init() {
    // TODO: implement init
  }

  late ThemeMode _themeMode;
  ThemeMode defaultThemeMode = ThemeMode.system;

  ThemeManager() {
    _getThemeModeFromSharedPrefs();
  }

  get themeMode {
    return _themeMode;
  }

  static bool isLight = true;

  static int getThemeID(ThemeMode themeMode) {
    var themeID = 0;
    switch (themeMode) {
      case ThemeMode.light:
        themeID = 1;
        break;
      case ThemeMode.dark:
        themeID = 2;
        break;
    }

    return themeID;
  }

  static String getThemeStr(ThemeMode themeMode) {
    var themeNameLocal = LocalStr.SystemTheme.toStr();
    switch (themeMode) {
      case ThemeMode.light:
        themeNameLocal = LocalStr.LightTheme.toStr();
        break;
      case ThemeMode.dark:
        themeNameLocal = LocalStr.DarkTheme.toStr();
        break;
    }

    return themeNameLocal;
  }

  setThemeMode(ThemeMode themeMode) {
    _themeMode = themeMode;

    var themeID = getThemeID(_themeMode);
    var themeNameLocal = getThemeStr(_themeMode);

    isLight = _themeMode == ThemeMode.light;

    _preferencesService.themeMode = themeMode.toString();
    _preferencesService.themeID = themeID;
    _preferencesService.themeName = themeNameLocal;

    // _saveThemeModeInSharedPrefs(themeMode);
    notifyListeners();
  }

  void _getThemeModeFromSharedPrefs() async {
    String themeModeFromPrefs = _preferencesService.themeMode;

    _themeMode = ThemeMode.values.firstWhere(
            (element) => themeModeFromPrefs == element.toString(),
        orElse: () => defaultThemeMode
    );

    if (_themeMode == ThemeMode.system) {
      var brightness = SchedulerBinding.instance.window.platformBrightness;
      isLight = brightness != Brightness.dark;
    }
    else
      isLight = _themeMode == ThemeMode.light;

    notifyListeners();
  }

  // https://stackoverflow.com/questions/60864189/body2-is-deprecated-and-shouldnt-be-used-this-is-the-term-used-in-the-2014-ver
  // Increase Font Size Text : all App
  static ThemeData lightTheme(context) {
    // add font workSans for all app
    var textTheme = GoogleFonts.workSansTextTheme(
        TextTheme(
          bodyText1: TextStyles.getTextNormalSize(),
          bodyText2: TextStyles.getTextNormalSize(),
          caption: TextStyles.getTextNormalSize(),
          subtitle2: TextStyles.getTextNormalSize(),
          button: TextStyles.getTextNormalSize(),
          overline: TextStyles.getTextNormalSize(),
          headline6: TextStyles.getTextSmallSize(),
          headline1: TextStyles.getTextHeaderSize(),
          subtitle1: TextStyles.getTextNormalSize(),
        )
    );

    return ThemeData(
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontWeight: FontWeight.w600,),
            primary: AppColors.primaryLight,)),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontWeight: FontWeight.w600,),
            primary: AppColors.primaryLight),),
      primaryColor: AppColors.primaryLight,
      appBarTheme: const AppBarTheme(
          color: AppColors.primaryLight, systemOverlayStyle: SystemUiOverlayStyle.light),
      brightness: Brightness.light,
      primaryTextTheme: textTheme,
      textTheme: textTheme,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.primaryLight),
    );
  }

  static ThemeData darkTheme(context) {
    // add font workSans for all app
    var textTheme = GoogleFonts.workSansTextTheme(
        TextTheme(
          headline5: const TextStyle(color: AppColors.borderDark,),
          subtitle1: TextStyles.getTextNormalSizeDark(),
          headline6: TextStyles.getTextNormalSizeDark(),
          subtitle2: TextStyles.getTextNormalSizeDark(),
          headline4: const TextStyle(color: AppColors.borderDark,),
          headline3: const TextStyle(color: AppColors.borderDark,),
          headline2: const TextStyle(color: AppColors.borderDark,),
          headline1: const TextStyle(color: AppColors.borderDark,),
          bodyText2: TextStyles.getTextNormalSizeDark(),
          bodyText1: TextStyles.getTextNormalSizeDark(),
          button: TextStyles.getTextNormalSizeDark(),
          caption: TextStyles.getTextNormalSizeDark(),
          overline: TextStyles.getTextNormalSizeDark(),
        )
    );

    return ThemeData().copyWith(
      bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: AppColors.bgDark),
      focusColor: AppColors.borderDark,
      disabledColor: AppColors.borderDark,
      // For popupmenuitem background color
      cardColor: AppColors.bgDark,
      scaffoldBackgroundColor: AppColors.bgDark,
      primaryColor: AppColors.primaryDark,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.secondaryDark),
      hintColor: AppColors.borderDark,
      cursorColor: AppColors.borderDark,
      textTheme: textTheme,
      primaryTextTheme: textTheme,
      brightness: Brightness.light,
      backgroundColor: AppColors.bgDark,
      dialogBackgroundColor: AppColors.bgDark,
      dividerColor: AppColors.borderDark,
      dialogTheme: const DialogTheme(
          contentTextStyle: TextStyle(color: AppColors.borderDark),
          titleTextStyle: TextStyle(color: AppColors.borderDark)),
      canvasColor: AppColors.bgDark,
      appBarTheme: const AppBarTheme(
          color: AppColors.primaryDark, systemOverlayStyle: SystemUiOverlayStyle.light),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        labelStyle: TextStyle(
          // color: Colors.yellow,
        ),
      ),
    );
  }
}