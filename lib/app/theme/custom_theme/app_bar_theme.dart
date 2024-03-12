import 'package:blekker/app/theme/custom_theme/colors.dart';
import 'package:flutter/material.dart';

class BlekkerAppBarTheme {
  BlekkerAppBarTheme._();

  static AppBarTheme appBarTheme = const AppBarTheme().copyWith(
    backgroundColor: BlekkerColors.primaryContrastColor,
    centerTitle: false,
    shape: const LinearBorder(
      bottom: LinearBorderEdge(
      ),
    ),
  );
}
