import 'package:flutter/material.dart';
import 'package:posts_mobx/constants/font_size.dart';
import 'package:posts_mobx/localization/app_localizations.dart';
import 'package:posts_mobx/route/route.dart';
import 'package:posts_mobx/service/locator.dart';
import 'package:posts_mobx/service/preferences_service.dart';
import 'package:posts_mobx/service/theme_manager.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool lockInBackground = true;
  bool notificationsEnabled = true;

  final PreferencesService _preferencesService = locator.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.settingsScreen,
          style: TextStyle(fontSize: appBarTitleFontSizeText))),
      body: buildSettingsList(),
    );
  }

  Widget buildSettingsList() {
    return SettingsList(
      // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      sections: [
        SettingsSection(
          tiles: [
            buildSettingsLanguage(),
            buildSettingsTheme(),
            // add Change Font Size App : Settings
            buildSettingsApplicationFontSize(),
            // buildSettingsUsePinCode(),
          ],
        ),
      ],
    );
  }

  SettingsTile buildSettingsApplicationFontSize() {
    return SettingsTile(
            title: Text(AppLocalizations.ApplicationFontSize),
            description: Text(_preferencesService.fontSizeName),
            leading: ThemeManager.getIcon(Icons.font_download),
            onPressed: (context) {
              Navigator.of(context).pushNamed(Routes.FONT_SIZE_SCREEN);
            },
          );
  }

  SettingsTile buildSettingsTheme() {
    return SettingsTile(
            title: Text(AppLocalizations.selectTheme),
            description: Text(AppLocalizations.getValue(_preferencesService.themeName.toString())),
            leading: ThemeManager.getIcon(Icons.nightlight_round),
            onPressed: (context) {
              Navigator.of(context).pushNamed(Routes.THEMES_SCREEN);
            },
          );
  }

  SettingsTile buildSettingsLanguage() {
    return SettingsTile(
            title: Text(AppLocalizations.selectLanguage),
            description: Text(_preferencesService.languageName),
            leading: ThemeManager.getIcon(Icons.language),
            onPressed: (context) {
              Navigator.of(context).pushNamed(Routes.LANGUAGES_SCREEN);
            },
          );
  }
}