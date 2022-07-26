import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posts_mobx/constants/colors.dart';
import 'package:posts_mobx/helper/text_styles.dart';
import 'package:settings_ui/settings_ui.dart';

// add class SettingTile : For Settings Title
class SettingTile  {
  static int currentItemID = 0;
}

SettingsTile getSettingsTile(String itemName, int itemID, void Function() onPressCallback){
  Widget trailingWidget(int index) {
    return (SettingTile.currentItemID == index)
        ? const Icon(Icons.check, color: AppColors.primaryLight)
        : const Icon(null);
  }

  return
    SettingsTile(
      trailing: trailingWidget(itemID),

      title: Text(itemName, style: TextStyles.getLabelTextFontStyle()),
      // titleTextStyle: TextStyles.getLabelTextFontStyle(),
      onPressed: (BuildContext context) {
        onPressCallback();
      },
    );
}