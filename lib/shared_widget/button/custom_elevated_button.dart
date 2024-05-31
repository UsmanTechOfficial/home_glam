import 'package:flutter/material.dart';
import 'package:home_glam/consts/global_var.dart';

class CustomElevatedButton extends StatelessWidget {
  final double? padTop;
  final double? padBtm;
  final Widget child;
  final VoidCallback onPressed;

  const CustomElevatedButton(
      {super.key,
      this.padTop,
      this.padBtm,
      required this.child,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: padTop ?? 0, bottom: padBtm ?? 0),
      child: SizedBox(
        width: mWidth(context),
        height: 50,
        child: ElevatedButton(onPressed: onPressed, child: child),
      ),
    );
  }
}
