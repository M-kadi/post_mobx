import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posts_mobx/pages/_shared/responsive.dart';
import 'package:posts_mobx/pages/content_home_screen/menu/side_menu.dart';

import '../content_home_screen/content_home_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
        body: Responsive(
          mobile: ContentHomeScreen(),
          tablet: Row(
            children: [
              Expanded(
                flex: getWebFlexMenu(_size),
                child: buildSideMenu(),
              ),
              Expanded(
                flex: getWebFlexBodyScreen(_size),
                child: ContentHomeScreen(),
              ),
            ],
          ),
          desktop: Row(
            children: [
              Expanded(
                flex: getWebFlexMenu(_size),
                child: buildSideMenu(),
              ),
              Expanded(
                flex: getWebFlexBodyScreen(_size),
                child: ContentHomeScreen(),
              ),
            ],
          ),
        )
    );
  }

  SideMenu buildSideMenu() {
    return SideMenu();
  }
}