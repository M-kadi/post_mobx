import 'package:flutter/material.dart';
import 'package:posts_mobx/constants/font_size.dart';
import 'package:posts_mobx/localization/app_localizations.dart';
import 'package:posts_mobx/service/locator.dart';
import 'package:posts_mobx/service/preferences_service.dart';
import 'package:posts_mobx/service/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

class ThemesScreen extends StatefulWidget {
  @override
  _ThemesScreenState createState() => _ThemesScreenState();
}

class _ThemesScreenState extends State<ThemesScreen> {
  int themeIndex = 0;
  final PreferencesService _preferencesService = locator.get();

  late ThemeManager _themeManager;

  @override
  void initState() {
    super.initState();
    themeIndex = _preferencesService.themeID;

    _themeManager = Provider.of<ThemeManager>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.selectTheme,
          style: TextStyle(fontSize: appBarTitleFontSizeText))),
      body: SettingsList(
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        sections: [
          SettingsSection(tiles: [
            _buildThemeTitle(AppLocalizations.system,ThemeMode.system),
            _buildThemeTitle(AppLocalizations.light,ThemeMode.light),
            _buildThemeTitle(AppLocalizations.dark,ThemeMode.dark),
          ]),
        ],
      ),
    );
  }

  SettingsTile _buildThemeTitle(themeName, themeMode) {
    var themeID = ThemeManager.getThemeID(themeMode);

    return SettingsTile(
      trailing: trailingWidget(themeID),
      title: Text(themeName),
      onPressed: (BuildContext context) {
        _themeManager.setThemeMode(themeMode) ;
        setState(() {
          themeIndex = themeID;
        });
      },
    );
  }

  Widget trailingWidget(int index) {
    return (themeIndex == index)
        ? const Icon(Icons.check, color: Colors.blue)
        : const Icon(null);
  }
}