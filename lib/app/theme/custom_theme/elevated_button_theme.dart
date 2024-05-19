// Copyright 2024 Sifterstudios

import 'package:blekker/app/theme/custom_theme/colors.dart';
import 'package:flutter/material.dart';

class BlekkerElevatedButtonTheme {
  static ElevatedButtonThemeData theme = ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStateProperty.all(const EdgeInsets.all(10)),
      shape: WidgetStateProperty.all(LinearBorder.none),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.pressed)) {
          return BlekkerColors.primaryContrastColor;
        }
        return BlekkerColors.primaryColor;
      }),
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.pressed)) {
          return BlekkerColors.primaryContrastColor;
        }
        return BlekkerColors.primaryColor;
      }),
      textStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.pressed)) {
          return const TextStyle().copyWith(
            color: BlekkerColors.secondaryColor,
            fontSize: 85,
          );
        }
        return const TextStyle().copyWith(
          color: BlekkerColors.primaryColor,
        );
      }),
    ),
  );
}
