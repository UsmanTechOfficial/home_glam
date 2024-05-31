import 'package:flutter/material.dart';

import '../../consts/color_const/color_scheme.dart';

NavigationDrawerThemeData get navigationDrawerTheme =>
    NavigationDrawerThemeData(
      backgroundColor: colorSchemeLight.surface,
      elevation: 2.0,
// You can add other properties as needed
    );

NavigationDrawerThemeData get darkNavigationDrawerTheme =>
    NavigationDrawerThemeData(
      backgroundColor: colorSchemeDark.surface,
      elevation: 2.0,
// You can add other properties as needed
    );
