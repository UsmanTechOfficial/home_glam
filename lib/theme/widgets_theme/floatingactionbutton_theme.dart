import 'package:flutter/material.dart';

import '../../consts/color_const/color_scheme.dart';

FloatingActionButtonThemeData get floatingActionButtonTheme =>
    FloatingActionButtonThemeData(
      backgroundColor: colorSchemeLight.primary,
      foregroundColor: colorSchemeLight.onPrimary,
      hoverColor: colorSchemeLight.primaryContainer.withOpacity(0.1),
      focusColor: colorSchemeLight.primaryContainer.withOpacity(0.2),
      splashColor: colorSchemeLight.secondaryContainer.withOpacity(0.2),
// Add other properties as needed
    );

FloatingActionButtonThemeData get darkFloatingActionButtonTheme =>
    FloatingActionButtonThemeData(
      backgroundColor: colorSchemeDark.primary,
      foregroundColor: colorSchemeDark.onPrimary,
      hoverColor: colorSchemeDark.primaryContainer.withOpacity(0.1),
      focusColor: colorSchemeDark.primaryContainer.withOpacity(0.2),
      splashColor: colorSchemeDark.secondaryContainer.withOpacity(0.2),
// Add other properties as needed
    );
