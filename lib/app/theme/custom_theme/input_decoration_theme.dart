// Copyright 2024 Sifterstudios

import 'package:blekker/app/theme/custom_theme/colors.dart';
import 'package:flutter/material.dart';

class BlekkerInputDecorationTheme {
  static OutlineInputBorder _border([
    Color color = BlekkerColors.primaryColor,
  ]) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(
          color: color,
        ),
      );
  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    contentPadding: const EdgeInsets.all(15),
    enabledBorder: _border(BlekkerColors.secondaryLabelTextColor),
    focusedBorder: _border(),
  );
}
