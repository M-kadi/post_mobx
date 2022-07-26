import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:posts_mobx/constants/font_size.dart';
import 'package:posts_mobx/helper/text_styles.dart';
import 'package:posts_mobx/localization/app_localizations.dart';
import 'package:posts_mobx/widgets/StaticWidgets.dart';

class AboutScreen extends StatefulWidget {
  @override
  AboutScreenScreenState createState() => AboutScreenScreenState();
}

class AboutScreenScreenState extends State<AboutScreen> {
  final _formKey = GlobalKey<FormState>();

  PackageInfo? _packageInfo;
  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  final appBar = AppBar(title: Text(AppLocalizations.aboutApp,
      style: TextStyle(fontSize: appBarTitleFontSizeText)));

  @override
  Widget build(BuildContext context) {
    final minHeight = MediaQuery
        .of(context)
        .size
        .height -
        appBar.preferredSize.height -
        MediaQuery
            .of(context)
            .padding
            .top;

    return Scaffold(
      appBar: appBar,
      body: Container(
        padding: paddingForm,
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction, key: _formKey,
          child: Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: minHeight,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(),
                          Column(
                              children: <Widget>[
                                _buildHeader(),
                                getSpace(),
                                _buildAppInfoTxt(),
                              ]),
                          _buildBottom(),
                        ],
                      )
                  )
              )
          ),
        ),
      ),
    );
  }

  // add : image login_header : LoginScreen
  Widget _buildBottom() {
    return
      StaticWidgets.getLogoBottom();
  }

  // add : image login_header : AboutScreen
  Widget _buildHeader() {
    return
      StaticWidgets.getLogoHeader();
  }

  Widget _buildAppItemInfoTxt(String txtLeft, String txtRight) {
    return
      Row(
        children: <Widget>[
          Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: AutoSizeText(
                  txtLeft, style: TextStyles.getTextStyle(), maxLines: 1,),
              )),
          const Expanded(
              flex: 1,
              child: Padding(padding: EdgeInsets.all(1))),
          Expanded(
              flex: 4,
              child: AutoSizeText(
                txtRight, style: TextStyles.getTextStyleGray(), maxLines: 1,))
        ],
      );
  }

  Widget _buildAppInfoTxt() {
    if(_packageInfo == null)
      return Container();

    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
          children: <Widget>[
            _buildAppItemInfoTxt(AppLocalizations.appName, _packageInfo?.appName ?? ''),
            _buildAppItemInfoTxt(AppLocalizations.version, _packageInfo?.version ?? ''),

            // app build date : APK
            _buildAppItemInfoTxt(AppLocalizations.AppBuildDate, '2022-01-01'),

            // api build date : from API service
            _buildAppItemInfoTxt(AppLocalizations.APIBuildDate, '2022-01-01'),

            getSpace(), getSpace(),

            if(kReleaseMode == false)
              const AutoSizeText('Debugging...', maxLines: 1,)
            else
              const Text(''),
      ]),
    );
  }
}