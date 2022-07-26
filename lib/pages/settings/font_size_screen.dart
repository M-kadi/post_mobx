import 'package:flutter/material.dart';
import 'package:posts_mobx/constants/font_size.dart';
import 'package:posts_mobx/localization/app_localizations.dart';
import 'package:posts_mobx/pages/settings/setting_title.dart';
import 'package:posts_mobx/service/locator.dart';
import 'package:posts_mobx/service/preferences_service.dart';
import 'package:settings_ui/settings_ui.dart';

class FontSizeScreen extends StatefulWidget {
  @override
  _FontSizeScreenState createState() => _FontSizeScreenState();
}

class _FontSizeScreenState extends State<FontSizeScreen> {
  final PreferencesService _preferencesService = locator.get();

  @override
  Widget build(BuildContext context) {
    SettingTile.currentItemID = _preferencesService.fontSizeID;

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.ApplicationFontSize,
          style: TextStyle(fontSize: appBarTitleFontSizeText))),
      body: SettingsList(
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        sections: [
          SettingsSection(tiles: [
            _buildFontSizeTitle(PreferencesService.fontSizeName0,0),
            _buildFontSizeTitle(PreferencesService.fontSizeName25,25),
            _buildFontSizeTitle(PreferencesService.fontSizeName50,50),
            _buildFontSizeTitle(PreferencesService.fontSizeName75,75),
          ]),
        ],
      ),
    );
  }

  SettingsTile _buildFontSizeTitle(String fontSizeName, int _fontSizeID) {
    Future onPressedSettingTile() {
      _preferencesService.setFontSizeApp(fontSizeName, _fontSizeID);

      setState(() {
        SettingTile.currentItemID = _fontSizeID;
      });

      return Future.value(1);
    }

    return
      getSettingsTile(fontSizeName, _fontSizeID, onPressedSettingTile);
  }
}