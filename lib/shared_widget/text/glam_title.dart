import 'package:flutter/cupertino.dart';

import '../../consts/global_var.dart';
import '../../consts/text_size.dart';

class GlamTitle extends StatelessWidget {
  final String top;
  final String centre;
  final String last;

  const GlamTitle(
      {super.key, required this.top, required this.centre, required this.last});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: '$top\n',
            style: TextStyle(
              letterSpacing: 1,
              fontSize: AppTextSize.titleMediumFont,
              fontWeight: FontWeight.w600,
              color: colorScheme(context).outline,
            ),
          ),
          TextSpan(
            text: 'HomeGlam\n',
            style: TextStyle(
              fontSize: AppTextSize.titleLargeFont,
              letterSpacing: 3,
              height: 1.5,
              fontWeight: FontWeight.w600,
              color: colorScheme(context).primary,
            ),
          ),
          TextSpan(
            text: '$centre\n',
            style: TextStyle(
              height: 2,
              letterSpacing: 1,
              fontWeight: FontWeight.w500,
              fontSize: AppTextSize.labelLargeFont,
              color: colorScheme(context).onSurface,
            ),
          ),
          TextSpan(
            text: last,
            style: TextStyle(
              letterSpacing: 1,
              fontWeight: FontWeight.w500,
              fontSize: AppTextSize.labelLargeFont,
              color: colorScheme(context).onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
