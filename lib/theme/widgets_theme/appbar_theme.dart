import 'package:flutter/material.dart';
import 'package:home_glam/consts/global_var.dart';
import 'package:home_glam/consts/text_size.dart';

import '../../consts/color_const/color_scheme.dart';

AppBarTheme get appBarTheme => AppBarTheme(
    surfaceTintColor: Colors.transparent,
    color: Colors.transparent,
    // Use the primary color from appSchemeLight
    iconTheme: IconThemeData(
      size: 28,
      color: colorSchemeLight.onSurface, // Use the onPrimary color for icons
    ),
    actionsIconTheme: IconThemeData(
      color: colorSchemeLight
          .onPrimary, // Use the onPrimary color for action icons
    ),
    titleTextStyle: TextStyle(
      color: colorSchemeLight.onSurface,
      fontFamily: appFontFamily,
      fontSize: AppTextSize.titleLargeFont,
    ),
    toolbarTextStyle: TextStyle(
      color: colorSchemeLight
          .onSurface, // Use the onSurface color for toolbar text
      fontSize: 18.0, // Example size, adjust as needed
    ));

AppBarTheme get darkAppBarTheme => AppBarTheme(
    surfaceTintColor: Colors.transparent,
    color: Colors.transparent,
    // Use the primary color from appSchemeDark
    iconTheme: IconThemeData(
      color: colorSchemeDark.onSurface, // Use the onPrimary color for icons
    ),
    actionsIconTheme: IconThemeData(
      color:
          colorSchemeDark.onPrimary, // Use the onPrimary color for action icons
    ),
    titleTextStyle: TextStyle(
      color: colorSchemeDark.onSurface,
      fontFamily: appFontFamily,
      fontSize: AppTextSize.titleLargeFont, // Example size, adjust as needed
    ),
    toolbarTextStyle: TextStyle(
      color:
          colorSchemeDark.onSurface, // Use the onSurface color for toolbar text
      fontSize: 18.0, // Example size, adjust as needed
    ));
