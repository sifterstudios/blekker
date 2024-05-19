// Copyright 2024 Sifterstudios

import 'package:blekker/app/theme/custom_theme/colors.dart';
import 'package:flutter/material.dart';

class BlekkerColorScheme {
  static ColorScheme darkColorScheme = const ColorScheme(
    brightness: Brightness.dark,
    primary: BlekkerColors.primaryColor,
    onPrimary: BlekkerColors.primaryContrastColor,
    secondary: BlekkerColors.secondaryColor,
    onSecondary: BlekkerColors.secondaryContrastColor,
    error: Colors.purpleAccent,
    onError: Colors.black,
    surface: BlekkerColors.secondaryColor,
    onSurface: BlekkerColors.secondaryContrastColor,
  );
}
