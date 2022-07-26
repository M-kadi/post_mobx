import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posts_mobx/constants/colors.dart';
import 'package:posts_mobx/helper/text_styles.dart';
import 'package:posts_mobx/service/theme_manager.dart';

class Decorations {
  static InputDecoration buildInputDecoration(String label, String hint,
      IconData? icon,
      {bool isHideCounterLength = true, suffixIcon = null}) {
    return InputDecoration(
      // hide Counter length TextField : text, int , double, ...
        counterText: (isHideCounterLength) ? "" : null,
        filled: true,
        fillColor: ThemeManager.isLight ? Colors.white : null,
        focusedBorder: getFocusedBorder(AppColors.textBorderFocusedLight),
        enabledBorder: getFocusedBorder(AppColors.textBorderLight),
        disabledBorder: getFocusedBorder(AppColors.textBorderLight),
        errorBorder: getFocusedBorder(AppColors.textBorderLight),
        focusedErrorBorder: getFocusedBorder(AppColors.textBorderFocusedLight),
        contentPadding: const EdgeInsetsDirectional.only(start: 20.0),
        suffixIcon: suffixIcon,
        prefixIcon: icon != null ? ThemeManager.getIcon(icon) : null,
        hintText: hint,
        hintStyle: TextStyles.getTextNormalSize(),
        labelText: label,
        // Change text color text dark focus
        labelStyle: TextStyles.getLabelTextFontStyle()
      // icon: ThemeManager.getIcon(icon, context)//new Icon(icon),
    );
  }

  // Correct Color border Dark of Text Input
  static OutlineInputBorder getFocusedBorder(Color color) {
    return
      OutlineInputBorder(
        borderSide: BorderSide(color: color, width: 1.5),
        borderRadius: BorderRadius.circular(12.0),
      );

    /*
    // TODO: Change Colors on Light/Dark
    return ThemeManager.isLight ?
    OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 1.5),
      borderRadius: BorderRadius.circular(12.0),
    ) :
    OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.borderDark),
      borderRadius: BorderRadius.circular(12.0),);
    */
  }
}