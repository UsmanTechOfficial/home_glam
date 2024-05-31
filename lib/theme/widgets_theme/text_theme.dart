import 'package:flutter/material.dart';
import 'package:home_glam/consts/global_var.dart';

import '../../consts/color_const/color_scheme.dart';
import '../../consts/text_size.dart';

TextTheme get txtTheme => TextTheme(
      displayLarge: textStyle(colorSchemeLight.onPrimary,
          AppTextSize.displayLargeFont, FontWeight.w300),
      displayMedium: textStyle(colorSchemeLight.onPrimary,
          AppTextSize.displayMediumFont, FontWeight.w300),
      displaySmall: textStyle(colorSchemeLight.onPrimary,
          AppTextSize.displaySmallFont, FontWeight.w400),
      headlineLarge: textStyle(colorSchemeLight.onPrimary,
          AppTextSize.headlineLargeFont, FontWeight.w400),
      headlineMedium: textStyle(colorSchemeLight.onPrimary,
          AppTextSize.headlineMediumFont, FontWeight.w400),
      headlineSmall: textStyle(colorSchemeLight.onPrimary,
          AppTextSize.headlineSmallFont, FontWeight.w400),
      titleLarge: textStyle(colorSchemeLight.onPrimary,
          AppTextSize.titleLargeFont, FontWeight.w500),
      titleMedium: textStyle(colorSchemeLight.onPrimary,
          AppTextSize.titleMediumFont, FontWeight.w400),
      titleSmall: textStyle(colorSchemeLight.onPrimary,
          AppTextSize.titleSmallFont, FontWeight.w500),
      bodyLarge: textStyle(colorSchemeLight.onSurface,
          AppTextSize.bodyLargeFont, FontWeight.w400),
      bodyMedium: textStyle(colorSchemeLight.onSurface,
          AppTextSize.bodyMediumFont, FontWeight.w400),
      bodySmall: textStyle(colorSchemeLight.onSurface,
          AppTextSize.bodySmallFont, FontWeight.w400),
      labelLarge: textStyle(colorSchemeLight.onPrimary,
          AppTextSize.labelLargeFont, FontWeight.w500),
      labelMedium: textStyle(colorSchemeLight.onPrimary,
          AppTextSize.labelMediumFont, FontWeight.w500),
      labelSmall: textStyle(colorSchemeLight.onSurface,
          AppTextSize.labelSmallFont, FontWeight.w400),
    );

TextTheme get darkTxtTheme => TextTheme(
      displayLarge: textStyle(colorSchemeDark.onPrimary,
          AppTextSize.displayLargeFont, FontWeight.w300),
      displayMedium: textStyle(colorSchemeDark.onPrimary,
          AppTextSize.displayMediumFont, FontWeight.w300),
      displaySmall: textStyle(colorSchemeDark.onPrimary,
          AppTextSize.displaySmallFont, FontWeight.w400),
      headlineLarge: textStyle(colorSchemeDark.onPrimary,
          AppTextSize.headlineLargeFont, FontWeight.w400),
      headlineMedium: textStyle(colorSchemeDark.onPrimary,
          AppTextSize.headlineMediumFont, FontWeight.w400),
      headlineSmall: textStyle(colorSchemeDark.onPrimary,
          AppTextSize.headlineSmallFont, FontWeight.w400),
      titleLarge: textStyle(colorSchemeDark.onPrimary,
          AppTextSize.titleLargeFont, FontWeight.w500),
      titleMedium: textStyle(colorSchemeDark.onPrimary,
          AppTextSize.titleMediumFont, FontWeight.w400),
      titleSmall: textStyle(colorSchemeDark.onPrimary,
          AppTextSize.titleSmallFont, FontWeight.w500),
      bodyLarge: textStyle(colorSchemeDark.onSurface, AppTextSize.bodyLargeFont,
          FontWeight.w400),
      bodyMedium: textStyle(colorSchemeDark.onSurface,
          AppTextSize.bodyMediumFont, FontWeight.w400),
      bodySmall: textStyle(colorSchemeDark.onSurface, AppTextSize.bodySmallFont,
          FontWeight.w400),
      labelLarge: textStyle(colorSchemeDark.onPrimary,
          AppTextSize.labelLargeFont, FontWeight.w500),
      labelMedium: textStyle(colorSchemeDark.onPrimary,
          AppTextSize.labelMediumFont, FontWeight.w500),
      labelSmall: textStyle(colorSchemeDark.onSurface,
          AppTextSize.labelSmallFont, FontWeight.w400),
    );

TextStyle textStyle(Color color, double fontSize, FontWeight fontWeight) {
  return TextStyle(
      color: color,
      fontSize: fontSize,
      fontFamily: appFontFamily,
      fontWeight: fontWeight);
}

// TextTheme get txtTheme => TextTheme(
//       displayLarge: TextStyle(
//           color: colorSchemeLight.onPrimary,
//           fontSize: AppTextSize.displayLargeFont,
//           fontWeight: FontWeight.w300),
//       displayMedium: TextStyle(
//           color: colorSchemeLight.onPrimary,
//           fontSize: AppTextSize.displayMediumFont,
//           fontWeight: FontWeight.w300),
//       displaySmall: TextStyle(
//           color: colorSchemeLight.onPrimary,
//           fontSize: AppTextSize.displaySmallFont,
//           fontWeight: FontWeight.w400),
//       headlineLarge: TextStyle(
//           color: colorSchemeLight.onPrimary,
//           fontSize: AppTextSize.headlineLargeFont,
//           fontWeight: FontWeight.w400),
//       headlineMedium: TextStyle(
//           color: colorSchemeLight.onPrimary,
//           fontSize: AppTextSize.headlineMediumFont,
//           fontWeight: FontWeight.w400),
//       headlineSmall: TextStyle(
//           color: colorSchemeLight.onPrimary,
//           fontSize: AppTextSize.headlineSmallFont,
//           fontWeight: FontWeight.w400),
//       titleLarge: TextStyle(
//           color: colorSchemeLight.onPrimary,
//           fontSize: AppTextSize.titleLargeFont,
//           fontWeight: FontWeight.w500),
//       titleMedium: TextStyle(
//           color: colorSchemeLight.onPrimary,
//           fontSize: AppTextSize.titleMediumFont,
//           fontWeight: FontWeight.w400),
//       titleSmall: TextStyle(
//           color: colorSchemeLight.onPrimary,
//           fontSize: AppTextSize.titleSmallFont,
//           fontWeight: FontWeight.w500),
//       bodyLarge: TextStyle(
//           color: colorSchemeLight.onSurface,
//           fontSize: AppTextSize.bodyLargeFont,
//           fontWeight: FontWeight.w400),
//       bodyMedium: TextStyle(
//           color: colorSchemeLight.onSurface,
//           fontSize: AppTextSize.bodyMediumFont,
//           fontWeight: FontWeight.w400),
//       bodySmall: TextStyle(
//           color: colorSchemeLight.onSurface,
//           fontSize: AppTextSize.bodySmallFont,
//           fontWeight: FontWeight.w400),
//       labelLarge: TextStyle(
//           color: colorSchemeLight.onPrimary,
//           fontSize: AppTextSize.labelLargeFont,
//           fontWeight: FontWeight.w500),
//       labelMedium: TextStyle(
//           color: colorSchemeLight.onPrimary,
//           fontSize: AppTextSize.labelMediumFont,
//           fontWeight: FontWeight.w500),
//       labelSmall: TextStyle(
//           color: colorSchemeLight.onSurface,
//           fontSize: AppTextSize.labelSmallFont,
//           fontWeight: FontWeight.w400),
//     );
//
// TextTheme get darkTxtTheme => TextTheme(
//       displayLarge: TextStyle(
//           color: colorSchemeDark.onPrimary,
//           fontSize: AppTextSize.displayLargeFont,
//           fontWeight: FontWeight.w300),
//       displayMedium: TextStyle(
//           color: colorSchemeDark.onPrimary,
//           fontSize: AppTextSize.displayMediumFont,
//           fontWeight: FontWeight.w300),
//       displaySmall: TextStyle(
//           color: colorSchemeDark.onPrimary,
//           fontSize: AppTextSize.displaySmallFont,
//           fontWeight: FontWeight.w400),
//       headlineLarge: TextStyle(
//           color: colorSchemeDark.onPrimary,
//           fontSize: AppTextSize.headlineLargeFont,
//           fontWeight: FontWeight.w400),
//       headlineMedium: TextStyle(
//           color: colorSchemeDark.onPrimary,
//           fontSize: AppTextSize.headlineMediumFont,
//           fontWeight: FontWeight.w400),
//       headlineSmall: TextStyle(
//           color: colorSchemeDark.onPrimary,
//           fontSize: AppTextSize.headlineSmallFont,
//           fontWeight: FontWeight.w400),
//       titleLarge: TextStyle(
//           color: colorSchemeDark.onPrimary,
//           fontSize: AppTextSize.titleLargeFont,
//           fontWeight: FontWeight.w500),
//       titleMedium: TextStyle(
//           color: colorSchemeDark.onPrimary,
//           fontSize: AppTextSize.titleMediumFont,
//           fontWeight: FontWeight.w400),
//       titleSmall: TextStyle(
//           color: colorSchemeDark.onPrimary,
//           fontSize: AppTextSize.titleSmallFont,
//           fontWeight: FontWeight.w500),
//       bodyLarge: TextStyle(
//           color: colorSchemeDark.onSurface,
//           fontSize: AppTextSize.bodyLargeFont,
//           fontWeight: FontWeight.w400),
//       bodyMedium: TextStyle(
//           color: colorSchemeDark.onSurface,
//           fontSize: AppTextSize.bodyMediumFont,
//           fontWeight: FontWeight.w400),
//       bodySmall: TextStyle(
//           color: colorSchemeDark.onSurface,
//           fontSize: AppTextSize.bodySmallFont,
//           fontWeight: FontWeight.w400),
//       labelLarge: TextStyle(
//           color: colorSchemeDark.onPrimary,
//           fontSize: AppTextSize.labelLargeFont,
//           fontWeight: FontWeight.w500),
//       labelMedium: TextStyle(
//           color: colorSchemeDark.onPrimary,
//           fontSize: AppTextSize.labelMediumFont,
//           fontWeight: FontWeight.w500),
//       labelSmall: TextStyle(
//           color: colorSchemeDark.onSurface,
//           fontSize: AppTextSize.labelSmallFont,
//           fontWeight: FontWeight.w400),
//     );
