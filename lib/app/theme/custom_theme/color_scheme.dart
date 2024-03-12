import 'package:blekker/app/theme/custom_theme/colors.dart';
import 'package:flutter/material.dart';

class BlekkerColorScheme {
  BlekkerColorScheme._();

  static ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: BlekkerColors.primaryColor,
    onPrimary: BlekkerColors.primaryContrastColor,
    secondary: BlekkerColors.secondaryColor,
    onSecondary: BlekkerColors.secondaryContrastColor,
    error: Colors.purpleAccent,
    onError: Colors.black,
    background: BlekkerColors.primaryContrastColor,
    onBackground: BlekkerColors.mainTextColor,
    surface: BlekkerColors.secondaryColor,
    onSurface: BlekkerColors.secondaryContrastColor,
  );
}
