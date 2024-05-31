import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_glam/consts/text_size.dart';

import '../main.dart';
import '../shared_widget/text/apptext.dart';

class CSnackBar {
  static void show(
    String message, {
    // bool multiLine = true,
    bool closeButton = false,
    double overflowThreshold = 1.0,
    bool longActionLabel = false,
    bool floatingType = true,
    bool longLength = false,
    IconData? icon,
    String? label,
    VoidCallback? onPressed,
  }) {
    final SnackBarAction? snackBarAction = label != null
        ? SnackBarAction(
            label: longActionLabel ? "" : label,
            onPressed: onPressed ?? () {},
          )
        : null;

    final snackBar = SnackBar(
      content: Row(
        children: [
          if (icon != null)
            Icon(
              icon,
              size: 25,
              color: Colors.white,
            ),
          if (icon != null) const SizedBox(width: 8),
          Flexible(
            child: CText(
              txt: message,
              align: TextAlign.start,
              size: AppTextSize.labelLargeFont,
              color: Colors.white,
            ),
          ),
        ],
      ),
      showCloseIcon: closeButton,
      closeIconColor: Colors.white,
      width: scaffoldMessengerKey.currentContext!.width * 0.95,
      behavior:
          floatingType ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
      action: snackBarAction,
      duration: Duration(seconds: !longLength ? 2 : 4),
      backgroundColor: const Color(0xFF424242),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      actionOverflowThreshold: overflowThreshold,
    );

    scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }
}