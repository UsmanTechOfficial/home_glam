import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:home_glam/consts/color_const/color_scheme.dart';

class AppGradient {
  static LinearGradient splashGradient = LinearGradient(
      colors: [colorSchemeLight.primaryContainer, colorSchemeLight.onPrimary],
      transform: const GradientRotation(1.5));
}
