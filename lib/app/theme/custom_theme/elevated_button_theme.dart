// Copyright 2024 Sifterstudios

import 'package:blekker/app/theme/custom_theme/colors.dart';
import 'package:flutter/material.dart';

class BlekkerElevatedButtonTheme {
  static ElevatedButtonThemeData theme = ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
      shape: MaterialStateProperty.all(LinearBorder.none),
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return BlekkerColors.primaryContrastColor;
        }
        return BlekkerColors.primaryColor;
      }),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return BlekkerColors.primaryContrastColor;
        }
        return BlekkerColors.primaryColor;
      }),
      textStyle: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
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
