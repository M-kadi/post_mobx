import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';
import 'package:posts_mobx/constants/Constants.dart';
import 'package:posts_mobx/helper/text_styles.dart';
import 'package:posts_mobx/localization/app_localizations.dart';
import 'package:posts_mobx/pages/_shared/responsive.dart';
import 'package:posts_mobx/pages/content_home_screen/data_grid/data_grid.dart';
import 'package:posts_mobx/route/route.dart';
import 'package:posts_mobx/service/locator.dart';
import 'package:posts_mobx/service/theme_manager.dart';
import 'package:posts_mobx/widgets/form_header.dart';
import 'package:provider/src/provider.dart';

import 'content_home.dart';
import 'content_home_model.dart';
import 'menu/menu_controller.dart';
import 'menu/side_menu.dart';

// add content_home_screen - Dashboard
class ContentHomeScreen extends StatefulWidget {
  @override
  _ContentHomeScreenState createState() => _ContentHomeScreenState();
}

class _ContentHomeScreenState extends State<ContentHomeScreen> {
  final ContentHomeModel _contentHomeModel = locator.get();

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    var _isVisibleSideMenu = Responsive.isMobile(context);

    Key? _buildSideMenuKey(BuildContext context) {
      if (_isVisibleSideMenu)
        return context
            .read<MenuController>()
            .scaffoldKey;

      return null;
    }

    Widget _buildSideMenu() {
      if (_isVisibleSideMenu)
        return SideMenu();

      return Container();
    }

    return
      Scaffold(
          key: _buildSideMenuKey(context),
          drawer: _buildSideMenu(),
          body: Stack(
            children: [
              Container(
                height: size.height * .3,
                width: size.width,
                decoration: BoxDecoration(
                    color: ThemeManager.getColorStatusBar()
                  // add image to header of : Grid
                  // image: DecorationImage(
                  //     alignment: Alignment.topCenter,
                  //     image: AssetImage("assets/images/header.png")
                  // )
                ),
              ),
              SafeArea(
                child: Column(
                  children: [
                    // Header : Title + SideMenu + Logo
                    _buildHeader(context, _isVisibleSideMenu),
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: DataGrid(
                                baseModel: _contentHomeModel,
                                buildListItemCallback: _buildGridItem
                            )
                        )
                    )
                  ],
                ),
              ),
            ],
          )
      );
  }

  Widget _buildHeader(context, _isVisibleSideMenu) {
    Widget buildMenuButton(BuildContext context) {
      if (_isVisibleSideMenu)
        return IconButton(
          icon: const Icon(Icons.menu, color: Colors.white, size: 35.0,),
          onPressed: context
              .read<MenuController>()
              .controlMenu,
        );

      return Container();
    }

    return
      FormHeader(
        title: 'Posts',
        titleColor: Colors.white,
        titleAlign: TextAlign.center,
        leftWidget: buildMenuButton(context),
        rightWidget: SvgPicture.asset(
          companyWithoutTextWhiteImage, height: 35, width: 35,),
      );
  }

  _fetchData() {
    _contentHomeModel.fetchDataFromLocal(context);
  }

  Widget? _buildGridItem(dynamic row, int index) {
    ContentHome myRow = row;
    var screenID = Routes.SETTINGS_SCREEN;
    var screenTitle = AppLocalizations.settingsScreen;

    switch (DashboardTypeFromStr(myRow.type)) {
      case DashboardType.users:
        screenID = Routes.USERS_LIST;
        screenTitle = AppLocalizations.usersScreen;
        break;

      case DashboardType.settings:
        screenID = Routes.SETTINGS_SCREEN;
        screenTitle = AppLocalizations.settingsScreen;
        break;
      default:
        return null;
    }

    return
      Card(
        // add Dashboard onClick users, items ...
        child: InkWell(
          onTap: () {
            _navigateDashboardScreen(screenID);
          },
          child:
          SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // getSpace(),
                  SvgPicture.asset(
                    ThemeManager.isLight ? myRow.img : myRow.imgDark,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.15,), //80 //0.10
                  AutoSizeText(screenTitle,
                      style: TextStyles.getTextStyle(),
                      textAlign: TextAlign.center,
                      maxLines: 1),
                ],
              )
          ),
        ),

        elevation: 4,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: ThemeManager.getColorBorder()),
            borderRadius: BorderRadius.circular(8)
        ),
      );
  }

  _navigateDashboardScreen(screen) {
    Navigator.of(context).pushNamed(screen);
  }
}