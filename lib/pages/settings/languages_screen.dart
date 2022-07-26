import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:posts_mobx/constants/colors.dart';
import 'package:posts_mobx/constants/font_size.dart';
import 'package:posts_mobx/localization/app_localizations.dart';
import 'package:posts_mobx/service/locator.dart';
import 'package:posts_mobx/service/preferences_service.dart';
import 'package:settings_ui/settings_ui.dart';

class LanguagesScreen extends StatefulWidget {
  @override
  _LanguagesScreenState createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  final PreferencesService _preferencesService = locator.get();

  int languageIndex = AppLocalizations.languageIDDefault;

  @override
  Widget build(BuildContext context) {
    languageIndex = _preferencesService.languageID;

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.selectLanguage,
          style: TextStyle(fontSize: appBarTitleFontSizeText))),
      body: SettingsList(
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        sections: [
          SettingsSection(tiles: [
            _buildLanguageTitle(AppLocalizations.enName,"assets/images/us.svg",AppLocalizations.enLanguage,AppLocalizations.enID),
            _buildLanguageTitle(AppLocalizations.nlName,"assets/images/nl.svg",AppLocalizations.nlLanguage,AppLocalizations.nlID),
            _buildLanguageTitle(AppLocalizations.trName,"assets/images/tr.svg",AppLocalizations.trLanguage,AppLocalizations.trID),
            _buildLanguageTitle(AppLocalizations.arName,"assets/images/sa.svg",AppLocalizations.arLanguage,AppLocalizations.arID),
          ]),
        ],
      ),
    );
  }

  SettingsTile _buildLanguageTitle(lanName, lanImg, lanCode, lanID) {
    return SettingsTile(
      leading: SvgPicture.asset(lanImg, width: 24, height: 24),
      trailing: trailingWidget(lanID),
      title: Text(lanName),
      onPressed: (BuildContext context) {
        _preferencesService.setLanguageCode(lanCode, lanName, lanID, context);

        setState(() {
          languageIndex = lanID;
        });
      },
    );
  }

  Widget trailingWidget(int index) {
    return (languageIndex == index)
        ? const Icon(Icons.check, color: AppColors.primaryLight)
        : const Icon(null);
  }
}