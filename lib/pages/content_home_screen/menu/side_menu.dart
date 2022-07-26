import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:posts_mobx/constants/Constants.dart';
import 'package:posts_mobx/localization/app_localizations.dart';
import 'package:posts_mobx/pages/_shared/responsive.dart';
import 'package:posts_mobx/route/route.dart';
import 'package:posts_mobx/service/theme_manager.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatefulWidget {

  SideMenu();

  @override
  SideMenuState createState() => SideMenuState();
}

class SideMenuState extends State<SideMenu> {
  late ThemeManager _themeManager;

  @override
  void initState() {
    super.initState();

    _themeManager = Provider.of<ThemeManager>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    var userType = "";

    return
      Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: AutoSizeText(
                  'Posts', maxLines: 1,),
                accountEmail: AutoSizeText(
                  '', maxLines: 1,),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.grey,
                  // Correct background color image ios
                  child: SvgPicture.asset(companyWithoutTextWhiteImage),
                ),
                otherAccountsPictures: <Widget>[
                  InkWell(
                      onTap: () {
                        if (ThemeManager.isLight)
                          _themeManager.setThemeMode(ThemeMode.dark);
                        else
                          _themeManager.setThemeMode(ThemeMode.light);
                      },
                      child: CircleAvatar(
                          child: ThemeManager.isLight ?
                          const Icon(Icons.nightlight_round) :
                          const Icon(Icons.wb_sunny)
                      )
                  ),
                ],
              ),

              _buildItem_ListTile(
                  AppLocalizations.usersScreen, Routes.USERS_LIST,
                  Icons.supervised_user_circle, context),
              _buildItem_ListTile(
                  AppLocalizations.settingsScreen, Routes.SETTINGS_SCREEN,
                  Icons.settings, context),
              _buildItem_ListTile(
                  AppLocalizations.aboutApp, Routes.ABOUT_SCREEN, Icons.info,
                  context),
            ],
          )
      );
  }

  _buildItem_ListTile(String screenTitle, String screenID, IconData screenIcon,
      context) {
    return ListTile(
      leading: ThemeManager.getIcon(
          screenIcon, isSelected: Routes.CURRENT_SCREEN == screenID),
      title: Text(screenTitle),
      selected: Routes.CURRENT_SCREEN == screenID,
      onTap: () {
        // add : user roles
        if (Responsive.isMobile(context))
          Navigator.pop(context);
        Navigator.of(context).pushNamed(screenID);

        setState(() => Routes.CURRENT_SCREEN = screenID);
      },
    );
  }
}