// Copyright 2024 Sifterstudios

import 'package:blekker/app/theme/custom_theme/color_scheme.dart';
import 'package:blekker/app/theme/custom_theme/colors.dart';
import 'package:flutter/material.dart';

class BlekkerButtonTheme {
  static ButtonThemeData buttonTheme = ButtonThemeData(
    shape: const Border.symmetric(),
    colorScheme: BlekkerColorScheme.darkColorScheme,
    buttonColor: BlekkerColors.primaryColor,
    disabledColor: BlekkerColors.secondaryColor,
    padding: const EdgeInsets.all(30),
  );
}
