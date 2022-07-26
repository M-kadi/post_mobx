import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:posts_mobx/constants/Constants.dart';
import 'package:posts_mobx/constants/colors.dart';
import 'package:posts_mobx/constants/font_size.dart';
import 'package:posts_mobx/service/theme_manager.dart';

class StaticWidgets {
  // add MyTool.isIOS : Constant
  static bool isIOS = false;

  static const imgPos = 10.0;
  static const imgPad = 10.0;
  static const imgPad2 = 80.0;
  static const imgPad1 = 10.0;

  static Widget getLogoBottom() {
    return
      getSpace();
  }

  static Widget getLogoHeader() {
    return
      Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: SvgPicture.asset(companyImage)
            ),
            const SizedBox(height: imgPos),
          ]
      );
  }

  static Widget buildTitleDivider(String title) {
    return
      Column(children: [
        Container(
            alignment: Alignment.center,
            height: heightTitleDivider,
            color: Colors.green,
            width: double.infinity,
            child:
            Text(title, style: TextStyle(fontSize: fontSizeActionBtn,
                backgroundColor: Colors.green,
                color: Colors.white), textAlign: TextAlign.center,)
        ),

        getSpace()]);
  }

}

Widget getSpace({space = 7.0}){
  return
    Padding(padding: EdgeInsets.all(space));
}

final myDivider1 = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      const Divider(color: Colors.brown, thickness: 100,),
      getSpace()
    ]
  );

final myDivider = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      SizedBox(
          height: 10.0,
          child: Center(
            child: Container(
              margin: const EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
              height: 5.0,
              color: Colors.brown,
            ),
          )
      ),
      getSpace()
    ]
);

const textBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(90.0)),
    borderSide: BorderSide(
      color: Colors.transparent,
    )
);

Widget getListDivider(){
  return
    Container(height: 1, color: ThemeManager.getColorBorder());
}

const paddingForm = EdgeInsets.symmetric(horizontal: 25.0); //43.0

const radiusButton = 12.0; //90 //18

Widget getWebLogoBody() {
  return
    Container(
        color: AppColors.logoBodyLight,
        alignment: Alignment.center,
        child: SvgPicture.asset(companyImage)
    );
}

BorderRadius getBorderCircular(){
  return
    BorderRadius.circular(20.0);
}

IconButton getBackBtn(context) {
  return IconButton(
      icon: ThemeManager.getIcon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      }
  );
}