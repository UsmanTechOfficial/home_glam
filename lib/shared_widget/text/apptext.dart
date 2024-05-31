// custom_text_widget.dart

import 'package:flutter/material.dart';
import 'package:home_glam/consts/global_var.dart';

class CText extends StatelessWidget {
  final String txt;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  final TextOverflow? overflow;
  final TextAlign? align;
  final double? space;
  final double? padTop;
  final double? padBtm;
  final double? padLeft;
  final double? padRight;

  const CText(
      {super.key,
      required this.txt,
      this.color,
      this.size,
      this.weight,
      this.overflow,
      this.align,
      this.space,
      this.padTop,
      this.padBtm,
      this.padLeft,
      this.padRight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: padTop ?? 0,
          bottom: padBtm ?? 0,
          left: padLeft ?? 0,
          right: padRight ?? 0),
      child: Text(
        txt,
        textAlign: align ?? TextAlign.center,
        style: TextStyle(
            letterSpacing: space,
            overflow: overflow,
            fontFamily: appFontFamily,
            fontSize: size,
            fontWeight: weight,
            color: color),
      ),
    );
  }
}
