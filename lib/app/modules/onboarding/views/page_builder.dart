import 'package:flutter/material.dart';
import 'package:home_glam/consts/global_var.dart';
import 'package:home_glam/consts/text_size.dart';
import 'package:home_glam/shared_widget/text/apptext.dart';

class PageBuilder extends StatelessWidget {
  final String title;
  final String desc;
  final Widget child;

  const PageBuilder(this.title, this.desc, this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      child,
      const Spacer(),
      SizedBox(
        width: mWidth(context) * .8,
        child: Column(children: [
          CText(
            txt: title,
            align: TextAlign.center,
            color: colorScheme(context).primary,
            size: AppTextSize.titleSmallFont,
            weight: FontWeight.bold,
          ),
          const SizedBox(height: 10),
          CText(
            txt: desc,
            align: TextAlign.center,
            color: txtTheme(context).labelSmall!.color,
            size: AppTextSize.labelSmallFont,
            weight: FontWeight.bold,
          ),
        ]),
      ),
      const Spacer(),
    ]);
  }
}
