import 'package:flutter/material.dart';

import '../../consts/color_const/color_scheme.dart';

MaterialBannerThemeData get bannerTheme => MaterialBannerThemeData(
      backgroundColor: colorSchemeLight.secondaryContainer,
      // Use the secondaryContainer color for banner background
      contentTextStyle: TextStyle(
        color: colorSchemeLight.onSecondaryContainer,
        // Use the onSecondaryContainer color for text
        fontSize: 16.0,
        // Example size, adjust as needed
        fontWeight: FontWeight.w400, // Example weight, adjust as needed
      ),
      leadingPadding: const EdgeInsets.all(10),
      // Example padding, adjust as needed
      padding: const EdgeInsets.symmetric(
          horizontal: 16.0), // Example padding, adjust as needed
    );

MaterialBannerThemeData get darkBannerTheme => MaterialBannerThemeData(
      backgroundColor: colorSchemeDark.secondaryContainer,
      // Use the secondaryContainer color for banner background
      contentTextStyle: TextStyle(
        color: colorSchemeDark.onSecondaryContainer,
        // Use the onSecondaryContainer color for text
        fontSize: 16.0,
        // Example size, adjust as needed
        fontWeight: FontWeight.w400, // Example weight, adjust as needed
      ),
      leadingPadding: const EdgeInsets.all(10),
      // Example padding, adjust as needed
      padding: const EdgeInsets.symmetric(
          horizontal: 16.0), // Example padding, adjust as needed
    );
