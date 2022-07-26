import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:posts_mobx/helper/text_styles.dart';

class FormHeader extends StatefulWidget {
  String title;
  Widget leftWidget;
  Widget rightWidget;
  Color? titleColor;
  TextAlign? titleAlign;

  FormHeader({required this.title,
    required this.leftWidget,
    required this.rightWidget,
    this.titleColor,
    this.titleAlign
  });

  @override
  _FormHeaderState createState() => _FormHeaderState();
}

class _FormHeaderState extends State<FormHeader> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 64,
              margin: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  widget.leftWidget,
                  Flexible(fit: FlexFit.tight,
                    child: AutoSizeText(
                      widget.title,
                      style: TextStyles.getTextTitle().copyWith(
                          color: widget.titleColor ?? null
                      ),
                      textAlign: widget.titleAlign ?? TextAlign.start,
                      maxLines: 2,),
                  ),
                  widget.rightWidget,
                ],
              ),
            ))
    );
  }
}