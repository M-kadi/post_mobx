import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:posts_mobx/constants/colors.dart';
import 'package:posts_mobx/constants/font_size.dart';
import 'package:posts_mobx/service/theme_manager.dart';

class TextStyles {
  static TextStyle getTextNormalSize() {
    return TextStyle(fontSize: fontSizeText);
  }

  static TextStyle getTextTitle() {
    return TextStyle(fontSize: fontSizeActionBtn,
      fontWeight: FontWeight.bold,
      color: AppColors.textTitleLight,
    );
  }

  static TextStyle getTextHeaderSize() {
    return TextStyle(fontSize: fontSizeHeader,
      fontWeight: FontWeight.w600,
      color: AppColors.textHeaderLight,
    );
  }

  static TextStyle getTextNormalSizeDark() {
    return TextStyle(
        color: AppColors.borderDark,
        fontSize: fontSizeText
    );
  }

  static TextStyle getTextSmallSize() {
    return TextStyle(fontSize: fontSizeTextSmall);
  }

  static TextStyle getTextStyle() {
    return TextStyle(fontSize: fontSizeActionBtn,
        color: ThemeManager.getColorTextDashboard());
  }

  static TextStyle getTextStyleGray() {
    return TextStyle(fontSize: fontSizeActionBtn,
        color: ThemeManager.getColorTextDashboardGray());
  }

  static TextStyle getTextStyleWithouColor() {
    return TextStyle(fontSize: fontSizeActionBtn);
  }

  static TextStyle getTextStyleHeaderHomeScreen() {
    return TextStyle(fontSize: fontSizeHeaderHomeScreen, color: Colors.white);
  }

  static TextStyle getTextStyleHeaderLogin() {
    return TextStyle(fontSize: fontSizeHeader,
        fontWeight: FontWeight.bold,
        color: ThemeManager.getColorTextDashboard());
  }

  static TextStyle getLabelTextFontStyle() {
    return
      TextStyle(
          fontSize: fontSizeText,
          color: ThemeManager.getColorTxtFieldFocus()
      );
  }
}