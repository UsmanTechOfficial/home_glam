import 'package:flutter/material.dart';

import '../../consts/color_const/color_scheme.dart';

IconThemeData get primaryIconTheme =>
    IconThemeData(color: colorSchemeLight.onPrimary);

IconThemeData get darkPrimaryIconTheme =>
    IconThemeData(color: colorSchemeDark.onPrimary);
