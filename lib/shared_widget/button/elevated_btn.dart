import 'package:flutter/material.dart';
import 'package:home_glam/consts/global_var.dart';
import 'package:home_glam/consts/text_size.dart';
import 'package:home_glam/shared_widget/text/apptext.dart';

class TextElevatedBtn extends StatelessWidget {
  final double? padTop;
  final double? padBtm;
  final String title;
  final VoidCallback onPressed;

  const TextElevatedBtn(
      {super.key,
      this.padTop,
      this.padBtm,
      required this.title,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: padTop ?? 0, bottom: padBtm ?? 0),
      child: SizedBox(
        width: mWidth(context),
        height: 50,
        child: ElevatedButton(
          onPressed: onPressed,
          child: CText(
            txt: title,
            space: 2,
            weight: FontWeight.bold,
            size: AppTextSize.bodyLargeFont,
          ),
        ),
      ),
    );
  }
}
