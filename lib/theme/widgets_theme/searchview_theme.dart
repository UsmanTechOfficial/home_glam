import 'package:flutter/material.dart';

import '../../consts/color_const/color_scheme.dart';

SearchViewThemeData get searchViewTheme => SearchViewThemeData(
      backgroundColor: colorSchemeLight.surface,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
    );

SearchViewThemeData get darkSearchViewTheme => SearchViewThemeData(
      backgroundColor: colorSchemeDark.surface,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
