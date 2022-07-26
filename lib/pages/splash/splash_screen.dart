import 'dart:async';

import "package:collection/collection.dart";
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:posts_mobx/constants/Constants.dart';
import 'package:posts_mobx/data_types/int_type.dart';
import 'package:posts_mobx/dio_api/users_api.dart';
import 'package:posts_mobx/pages/users/post.dart';
import 'package:posts_mobx/pages/users/user_model.dart';
import 'package:posts_mobx/widgets/StaticWidgets.dart';

import '/route/route.dart';
import '/service/locator.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  final UsersApi _usersApi = locator.get();
  final UserModel _userModel = locator.get();

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 2));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    Future.delayed(Duration(seconds: 3), () {
      // just delay for showing this slash page clearer because it too fast
      checkSignedIn();
    });
  }

  void checkSignedIn() async {
    _userModel.usersList = await _usersApi.getAllUsers();
    _userModel.postsList = await _usersApi.getAllPosts();

    _userModel.usersPosts =
        groupBy(_userModel.postsList, (Post obj) => obj.userId.value);

    try {
      for (var entry in _userModel.usersPosts.entries) {
        var userIndex = _userModel.usersList.indexWhere((element) =>
        element.userId.value == (entry.key as int));
        _userModel.usersList[userIndex].postsCount =
            IntType(value: entry.value.length);
      }
    } catch (e) {
      print(e);
    }

    Navigator.of(context).pushReplacementNamed(Routes.HOME_SCREEN);
  }

  @override
  Widget build(BuildContext context) {
    return buildBody();
  }

  Scaffold buildBody() {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              StaticWidgets.getLogoBottom()
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                      companyImage,
                      width: animation.value * 200,
                      height: animation.value * 200)
              )
            ],
          ),
        ],
      ),
    );
  }
}