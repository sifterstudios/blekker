// Copyright 2024 Sifterstudios

import 'package:blekker/app/theme/custom_theme/colors.dart';
import 'package:flutter/material.dart';

class BlekkerFabTheme {
  static const FloatingActionButtonThemeData fabTheme =
      FloatingActionButtonThemeData(
    backgroundColor: BlekkerColors.primaryColor,
    foregroundColor: BlekkerColors.primaryContrastColor,
    shape: Border.symmetric(),
  );
}
